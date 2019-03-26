context("convert_flow")

test_that("Basic flow convertion", {
  
  expect_equal(convert_flow(30, 2), 1296)

})
