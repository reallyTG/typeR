library(uGMAR)
context("standard errors")

params12 <- c(1.0, 0.9, 0.25, 4.5, 0.7, 3.0, 0.8)
params12gs <- c(1.5, 0.8, 1.5, 2.9, 0.8, 1.1, 0.6, 3)

test_that("standardErrors work", {
  expect_equal(standardErrors(VIX, p=1, M=2, params=params12, model="GMAR"),
               c(0.22287268, 0.01964781, 0.03499853, 1.51288200, 0.11059016, 0.50706802, NA), tolerance=1e-3)
  expect_equal(standardErrors(VIX, p=1, M=c(1, 1), params=params12gs, model="G-StMAR"),
               c(NA, NA, NA, 0.28462956, 0.02547752, 0.20515650, NA, 0.27495956), tolerance=1e-3)
})


