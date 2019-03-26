library(testthat)
if (interactive()) {
    devtools::load_all()
} else {
    library("excerptr")
}
context("excerpts")
test_that("get", {
          current <- get_excerpts(directory = tempdir())[2]
          reference <- paste0("Remote:   devel @ origin ",
                              "(https://github.com/fvafrCU/excerpts/)")
          expect_equal(current, reference)
})
test_that("load", {
          current <- load_excerpts()
          reference <- rPython::python.exec("print (3)")
          expect_equal(current, reference)
})

context("Paths")
root <- tryCatch(rprojroot::find_root(rprojroot::is_r_package),
                 error = function(e) return("../..")
                 )

test_that("path, devel version", {
          expect_equal(construct_path(temporary = TRUE),
                       file.path(tempdir(), "excerpts"))
                 })
test_that("path, package option reset", {
          options("excerpts_path" = NULL)
          expect_equal(construct_path(temporary = TRUE),
                       file.path(tempdir(), "excerpts"))
                 })

context("Markdown")
test_that("md", {
          out_file <- file.path(tempdir(), "some_file.out")
          excerptr(file = file.path(root, "tests/files/some_file.R"),
                   output_path = out_file,
                   run_pandoc = FALSE)
          result <- readLines(out_file)
          expectation <- readLines(file.path(root,
                                             "tests/files/some_file.md"))
          expect_equal(result, expectation)
                 })

context("pandoc")
is_pandoc_installed <- nchar(Sys.which("pandoc")) > 0
if (is_pandoc_installed) {
    test_that("pandoc_formats", {
              out_file <- file.path(tempdir(), "some_file.md")
              excerptr(file = file.path(root, "tests/files/some_file.R"),
                       pandoc_formats = c("tex", "html"),
                       output_path = tempdir(),
                       run_pandoc = TRUE)
              result <- readLines(out_file)
              expectation <- readLines(file.path(root,
                                                 "tests/files/some_file.md"))
              expect_equal(result, expectation)
                 })

    test_that("pandoc_formats_list", {
              out_file <- file.path(tempdir(), "some_file.md")
              excerptr(file = file.path(root, "tests/files/some_file.R"),
                       pandoc_formats = list("tex", "html"),
                       output_path = tempdir(),
                       run_pandoc = TRUE)
              result <- readLines(out_file)
              expectation <- readLines(file.path(root,
                                                 "tests/files/some_file.md"))
              expect_equal(result, expectation)
                 })
}
