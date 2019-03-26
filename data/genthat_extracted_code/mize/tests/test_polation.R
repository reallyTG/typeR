context("Interpolation and Extrapolation")
test_that("Cubic interpolation can return NaN", {

  xc <- cubic_interpolate(0.9493646, 1.04033, 0.6949782, 0.1898729, 0.8138197,
                          0.03981831, ignoreWarnings = TRUE)
  testthat::expect_true(is.nan(xc))
})
