test_that("source lints", {
  # Source is not guaranteed to be findable on CRAN. See #37.
  skip_on_cran()
  # We have to exclude "object_usage_linter" because of
  # https://github.com/jimhester/lintr/issues/27.
  linter_mask <- names(lintr::default_linters) != "object_usage_linter"
  lintr::expect_lint_free(linters = lintr::default_linters[linter_mask])
})
