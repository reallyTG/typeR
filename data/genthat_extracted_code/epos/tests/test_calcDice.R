library(epos)
context("test_calcDice")

test_that("Test calcDice if it calculates the correct vector with dice coefficients", {
  expect_that(calcDice(c(1,2,3), c(2,3,4)), equals(1-c(0.0, 0.5, 2/3)))
})