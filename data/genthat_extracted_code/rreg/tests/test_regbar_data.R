
context("Available data")

test_that("Error message regbar when data not provided", {
  expect_error(regbar(),"'data' must be provided")
  expect_error(regbar(hfdata), "Both 'x' and 'y' should be specified")
  expect_error(regbar(hfdata, x = centre), "Both 'x' and 'y' should be specified")
  expect_error(regbar(hfdata, y = case1), "Both 'x' and 'y' should be specified")
})


test_that("Error message regrad when data not provided", {
  expect_error(regbar(),"'data' must be provided")
})
