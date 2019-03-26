context("plapply()")

test_that("plapply() and lapply() agree", {

  a <- list(a = rnorm(10), b = rnorm(20), c = rnorm(15), d = rnorm(13), e = rnorm(15), f = rnorm(22))
 
  # Some objects that will be needed by f1:
  b1 <- rexp(20)
  b2 <- rpois(10, 20)
 
  # The function
  f1 <- function(x) mean(x) + max(b1) - min(b2)
 
  # Call plapply
  res1 <- plapply(a, f1, needed.objects = c("b1", "b2"), workDir = "example1",
                  njobs = 2, max.hours = 1/120, check.interval.sec = 0.2,
                  clean.up = FALSE, rout = "example1.Rout")

  # Verify existence of directories and files, then delete
  expect_true(length(dir("example1")) == 8)
  expect_true(file.exists("example1.Rout"))
  expect_true(length(readLines("example1.Rout")) > 10)

  unlink("example1", force = TRUE, recursive = TRUE)
  unlink("example1.Rout", force = TRUE)
  
  # Verify the result with lapply
  res2 <- lapply(a, f1)
 
  # Compare results--if all(quick.comp) is TRUE, then lists are equivalent
  expect_equal(res1, res2)

  # Comparing ordering
  numbers <- 1:10

  f2 <- function(x) x

  res3 <- plapply(numbers, f2, njobs = 2, workDir = "example3",
                  max.hours = 1/120, check.interval.sec = 0.5,
                  collate = TRUE)

  # Verify the directory got removed
  expect_true(!file.exists("example3"))
  
  res4 <- plapply(numbers, f2, njobs = 2, workDir = "example4",
                  max.hours = 1/120, check.interval.sec = 0.5,
                  random.seed = 7)

  res5 <- lapply(numbers, f2)

  expect_equal(res3, res5)
  expect_equal(res4, res5)

})



