context("Check use of simulate() shows a warning (deprecated)")
test_that("simulate() returns an error", {
  expect_warning(simulate())
})
