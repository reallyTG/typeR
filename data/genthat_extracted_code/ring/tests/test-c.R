context("C interface")

test_that("check package", {
  skip_on_cran()
  ## This one needs a local installation of ring to work for the
  ## LinkingTo: interface to work (skip_if_not_installed does not work
  ## for this as despite the name it doesn't check installation, it
  ## checks if it can be loaded).
  if (!("ring" %in% .packages(TRUE))) {
    skip("ring not installed")
  }
  Sys.setenv("R_TESTS" = "")

  R <- file.path(R.home(), "bin", "R")
  res <- system2(R, c("CMD", "build", "testing"),
                 stdout = FALSE, stderr = FALSE)
  path <- sprintf("testing_%s.tar.gz", "0.0.1")
  res <- system2(R, c("CMD", "check", "--no-manual", path),
                 stdout = TRUE, stderr = TRUE)
  expect_null(attr(res, "status"))
  file.remove(path)
  unlink("testing.Rcheck", recursive = TRUE)
})

test_that("standalone", {
  skip_on_cran()
  gcc <- Sys.which("gcc")
  if (!nzchar(gcc)) {
    skip("No gcc")
  }

  path <- system.file("include", package = "ring")
  args <- c(include_flags(FALSE), "-std=c99",
            "-o", "ring_standalone", "ring_standalone.c", "-lm")
  code <- system2(gcc, args)
  expect_equal(code, 0)
  if (file.exists("ring_standalone")) {
    code <- system2(normalizePath("ring_standalone"))
    expect_equal(code, 0)
    file.remove("ring_standalone")
  }
})

test_that("standalone (c++)", {
  skip_on_cran()
  gpp <- Sys.which("g++")
  if (!nzchar(gpp)) {
    skip("No g++")
  }
  path <- system.file("include", package = "ring")
  args <- c("-I", path, "-o", "ring_standalone", "ring_standalone.cpp")
  code <- system2(gpp, args)
  expect_equal(code, 0)
  if (file.exists("ring_standalone")) {
    code <- system2(normalizePath("ring_standalone"))
    expect_equal(code, 0)
    file.remove("ring_standalone")
  }
})

test_that("example", {
  skip_on_cran()
  Sys.setenv("R_TESTS" = "")

  ## Here is the R implementation from the vignette:
  example <- function(n) {
    step <- function(x) {
      if (length(x) > 1) {
        p <- mean(diff(x)) / 2 + 0.5
      } else {
        p <- 0.5
      }
      if (runif(1) < p) x[length(x)] - 1L else x[length(x)] + 1L
    }

    x <- 0L
    buf <- ring_buffer_env(5)
    h <- integer(n)
    buf$push(x)
    h[1L] <- x

    for (i in seq_len(length(h) - 1L)) {
      x <- step(unlist(buf$read(buf$used())))
      buf$push(x)
      h[i + 1L] <- x
    }
    h
  }

  R <- file.path(R.home(), "bin", "R")

  writeLines(paste0("PKG_CPPFLAGS = ", include_flags(FALSE)),
             "Makevars")
  file.copy(system.file("examples/example.c", package = "ring"), ".",
            overwrite = TRUE)
  on.exit(file.remove(c("example.c", "Makevars")))

  res <- system2(R, c("CMD", "SHLIB", "example.c"),
                 stdout = FALSE, stderr = FALSE)
  expect_equal(res, 0)

  dll <- paste0("example", .Platform$dynlib.ext)
  dyn.load(dll)

  on.exit({
    dyn.unload(dll)
    file.remove(dll)
    file.remove("example.o")
  }, add = TRUE)

  set.seed(1)
  res_r <- example(20)
  set.seed(1)
  res_c <- .Call("r_example", 20L, PACKAGE = "example")

  expect_equal(res_r, res_c)
})
