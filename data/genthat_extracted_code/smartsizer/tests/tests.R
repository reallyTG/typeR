library(testthat)
test_that("Check correct class of computePower", {
  expect_is(computePower(V = rbind(c(1,0.2,0.2,0.2),
                                   c(0.2,1,0.2,0.2),
                                   c(0.2, 0.2, 1, 0.2),
                                   c(0.2, 0.2, 0.2, 1)),
                         Delta = c(0, 0.5, 0.5, 0.5),
                         min_Delta = 0.5,
                         alpha = 0.05,
                         sample_size = 100), "numeric")
})

test_that("Check correct class of Sample Size", {
  expect_is(computeSampleSize(V = rbind(c(1,0.2,0.2,0.2),
                                   c(0.2,1,0.2,0.2),
                                   c(0.2, 0.2, 1, 0.2),
                                   c(0.2, 0.2, 0.2, 1)),
                         Delta = c(0, 0.5, 0.5, 0.5),
                         min_Delta = 0.5,
                         alpha = 0.05,
                         desired_power = 0.8), "numeric")
})


test_that("Check power grid is same length as sample_size_grid", {
  expect_equal(length(computePowerBySampleSize(V = diag(4), Delta = c(0,0.5,0.5,0.5), min_Delta = 0.5, alpha = 0.05, sample_size_grid = seq(50,500,50))), length(seq(50, 500, 50)))
})
