context("simulated index scenario for five default indices")
library(vamc)

test_that("Test the congruence of two simulations with dT = 1 / 12", {
  vol <- c(0.15, 0.20, 0.17, 0.029, 0.0061)
  mCov <- diag(vol)
  tmp <- tempfile()
  expect_equal_to_reference(genIndexScen(mCov, 100, 360, indexNames, 1 / 12,
                                         cForwardCurve, 1),
                            tmp, update = TRUE)
})

test_that("Test the congruence of two simulations with dT = 1 / 6", {
  vol <- c(0.15, 0.20, 0.17, 0.029, 0.0061)
  mCov <- diag(vol)
  tmp <- tempfile()
  expect_equal_to_reference(genIndexScen(mCov, 100, 360, indexNames, 1 / 6,
                                         cForwardCurve, 1),
                            tmp, print = TRUE)
})

test_that("Test the congruence of two simulations with dT = 1", {
  vol <- c(0.15, 0.20, 0.17, 0.029, 0.0061)
  mCov <- diag(vol)
  tmp <- tempfile()
  expect_equal_to_reference(genIndexScen(mCov, 100, 360, indexNames, 1,
                                         cForwardCurve, 1),
                            tmp, print = TRUE)
})

test_that("Test the ability to handle user error", {
  vol <- c(0.15, 0.20, 0.17, 0.029, 0.0061)
  mCov <- diag(vol)

  expect_error(genIndexScen(mCov, 0, 360, indexNames, 1, cForwardCurve, 1),
               "Please input a numScen and numStep greater than zero")
  expect_error(genIndexScen(mCov, 100, 0, indexNames, 1, cForwardCurve, 1),
               "Please input a numScen and numStep greater than zero")
  expect_error(genIndexScen(mCov, 0, 0, indexNames, 1, cForwardCurve, 1),
               "Please input a numScen and numStep greater than zero")
})
