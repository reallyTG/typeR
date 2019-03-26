context("simulated fund scenario for a default of 10 funds")
library(vamc)

vol <- c(0.15, 0.20, 0.17, 0.029, 0.0061)   # annual vol for five indices
mCov <- diag(vol) # independent indices for demonstration purpose

test_that("Test the congruence of two simulations under the same seed", {
  indexScen <- genIndexScen(mCov, 100, 360, indexNames, 1 / 12,
                            cForwardCurve, 1)
  tmp <- tempfile()
  expect_equal_to_reference(genFundScen(fundMap, indexScen), tmp)
})

test_that("Test error message when numFund does not align", {
  indexScen <- genIndexScen(mCov, 100, 360, indexNames, 1 / 12,
                            cForwardCurve, 1)
  fundMap <- rbind(c(1,    0,    0,    0),
                   c(0,    1,    0,    0),
                   c(0,    0,    0,    0),
                   c(0,    0,    1,    0),
                   c(0,    0,    0,    1),
                   c(0.6,  0.4,  0,    0),
                   c(0.5,  0,    0.5,  0),
                   c(0.5,  0,    0.5,  0),
                   c(0.3,  0.7,  0,    0),
                   c(0.25, 0.25, 0.25, 0.25))
  expect_error(genFundScen(fundMap, indexScen),
               "Funds from indexScen should align with funds from fundMap")
})
