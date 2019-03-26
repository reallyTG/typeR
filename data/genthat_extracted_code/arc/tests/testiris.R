context("Integration test")

test_that("test if iris dataset goes through", {
  expect_equal(cbaIris(),0.90,tolerance=0.1)
})




