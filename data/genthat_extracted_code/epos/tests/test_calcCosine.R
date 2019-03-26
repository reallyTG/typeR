library(epos)
context("test_calcCosine")

test_that("Test calcCosine if it calculates the correct vector with cosine coefficients", {
  expect_that(calcCosine(c(1,2,3), c(2,3,4)), equals(1-c(0.0, 0.5, 2/3)))
})