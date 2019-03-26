testthat::context("Testing fakemake:::throw()")
testthat::test_that("throw the fakemake exception", {
                        error_message <- "test error"
                        testthat::expect_error(fakemake:::throw("test error"),
                                               error_message)
}
)
