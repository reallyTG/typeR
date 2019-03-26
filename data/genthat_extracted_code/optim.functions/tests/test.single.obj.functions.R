library(optim.functions)
context("single objective functions")

test_that("The minimum of the ackley function is 0 at x=0", {
  expect_equal(ackley(c(0,0,0,0)), 0)
})
