context("Missing arguments")

library(BiDimRegression)

test_that("Error is generated when arguments are missing", {
  expect_error(lm2())
  expect_error(lm2(A+B ~ C+D))
  expect_error(lm2(A+B ~ C+D, NakayaData))
})
