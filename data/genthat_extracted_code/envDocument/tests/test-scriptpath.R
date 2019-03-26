context("scriptpath")

# do we get an error from getScriptPath?
test_that("scriptpath error", {
  expect_error(getScriptPath(), regexp = NULL)
})
