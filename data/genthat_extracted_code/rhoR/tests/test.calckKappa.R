library(testthat)
context("Test kappa calculations")

test_that("kappa is correct", {
  expect_equal(floor(calcKappa(contingencyTable, isSet = F)*10000), 6250)
})