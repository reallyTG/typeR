library(testthat)
library(SmartEDA)


context("Summary statistics")

test_that("ExpKurtosis and ExpSkew are measures of shapes value", {
  expect_equal(ExpKurtosis(c(1:4),type="moment"), 1.64)
  set.seed(1234)
  expect_equal(ExpSkew(sample(1:100,10),type="moment"),-0.2131082)
})


test_that("ExpKurtosis and ExpSkew are measures of shapes value", {
  expect_equal(ExpKurtosis(c(1:4),type="moment"), 1.64)
  set.seed(1234)
  expect_equal(ExpSkew(sample(1:100,10),type="moment"),-0.2131082)
})


