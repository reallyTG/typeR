context("lints")
test_that("code quality and style", {
  skip_if_not_installed("lintr")
  skip_on_travis()
  skip_on_cran()
  lintr::expect_lint_free()
})
