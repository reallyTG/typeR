library(epos)
context("test_calcJaccard")

test_that("Test calcJaccard if it calculates the correct vector with jaccard coefficients", {
  expect_that(calcJaccard(c(1,2,3), c(2,3,4)), equals(1-c(0.0, 1/3, 0.5)))
})