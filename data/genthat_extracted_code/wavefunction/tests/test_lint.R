test_that("source lints", {
  # Source is not guaranteed to be findable on CRAN.
  skip_on_cran()
  lintr::expect_lint_free()
})
