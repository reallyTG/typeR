context("Code Style")


test_that("Code style is in line with INWT style conventions", {
  Sys.setenv(NOT_CRAN = "true")
  lintr::expect_lint_free(linters = INWTUtils::selectLinters())
})
