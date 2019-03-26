testthat::context("Testing rasciidoc:::throw()")
testthat::test_that("throw the rasciidoc exception", {
                        error_message <- "hello, testthat"
                        string <- "hello, testthat"
                        testthat::expect_error(rasciidoc:::throw(string),
                            error_message)
}
)
