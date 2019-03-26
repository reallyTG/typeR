context("logging")

test_that("initializeLogging stops when logDir is invalid", {
  expect_error(initializeLogging(),
               "Required parameter 'logDir' is missing.")
})
