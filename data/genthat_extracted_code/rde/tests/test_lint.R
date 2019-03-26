if (requireNamespace("lintr", quietly = TRUE)) {
  context("linting package")
  test_that("Package Style", {
    lintr::expect_lint_free()
  })
}
