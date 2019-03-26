library(testthat)
library(pwrAB)

context("Check if output is consistent")

### AB_t2n tests

test_that("Output is consistent for AB_t2n two_sided test", {
  # power
  expect_equal(AB_t2n(N = 3000, percent_B = .4, mean_diff = .15, sd_A = 1,
                      sd_B = 2, sig_level = .05,
                      alternative = 'two_sided')$power, 0.6714653, tolerance = .01)
  # sig_level
  expect_equal(AB_t2n(N = 3000, percent_B = .4, mean_diff = .15, sd_A = 1,
                      sd_B = 2, power = 0.6714653,
                      alternative = 'two_sided')$sig_level, 0.05, tolerance = .002)
  # N
  expect_equal(AB_t2n(percent_B = .4, mean_diff = .15, sd_A = 1,
                      sd_B = 2, sig_level = .05, power = 0.6714653,
                      alternative = 'two_sided')$N, 3000, tolerance = 1)
  # percent_B
  expect_equal(AB_t2n(N = 3000, mean_diff = .15, sd_A = 1,
                      sd_B = 2, sig_level = .05, power = 0.6714653,
                      alternative = 'two_sided')$percent_B, .4, tolerance = .01)
  # mean_diff
  expect_equal(AB_t2n(N = 3000, percent_B = .4,
                      sd_A = 1, sd_B = 2, sig_level = .05, power = 0.6714653,
                      alternative = 'two_sided')$mean_diff, .15, tolerance = .002)
})

test_that("Output is consistent for AB_t2n 'less' test", {
  # power
  expect_equal(AB_t2n(N = 3000, percent_B = .4, mean_diff = -.15, sd_A = 1,
                      sd_B = 2, sig_level = .05,
                      alternative = 'less')$power, 0.7762178, tolerance = .01)
  # sig_level
  expect_equal(AB_t2n(N = 3000, percent_B = .4, mean_diff = -.15, sd_A = 1,
                      sd_B = 2, power = 0.7762178,
                      alternative = 'less')$sig_level, 0.05, tolerance = .002)
  # N
  expect_equal(AB_t2n(percent_B = .4, mean_diff = -.15, sd_A = 1,
                      sd_B = 2, sig_level = .05, power = 0.7762178,
                      alternative = 'less')$N, 3000, tolerance = 1)
  # percent_B
  expect_equal(AB_t2n(N = 3000, mean_diff = -.15, sd_A = 1,
                      sd_B = 2, sig_level = .05, power = 0.7762178,
                      alternative = 'less')$percent_B, .4, tolerance = .01)
  # mean_diff
  expect_equal(AB_t2n(N = 3000, percent_B = .4, sd_A = 1,
                      sd_B = 2, sig_level = .05, power = 0.7762178,
                      alternative = 'less')$mean_diff, -.15, tolerance = .002)
})

test_that("Output is consistent for AB_t2n 'greater' test", {
  # power
  expect_equal(AB_t2n(N = 2000, percent_B = .4, mean_diff = .2, sd_A = 3,
                      sd_B = 2, sig_level = .05,
                      alternative = 'greater')$power, 0.5570109, tolerance = .01)
  # sig_level
  expect_equal(AB_t2n(N = 2000, percent_B = .4, mean_diff = .2, sd_A = 3,
                      sd_B = 2, power = 0.5570109,
                      alternative = 'greater')$sig_level, 0.05, tolerance = .002)
  # N
  expect_equal(AB_t2n(percent_B = .4, mean_diff = .2, sd_A = 3,
                      sd_B = 2, sig_level = .05, power = 0.5570109,
                      alternative = 'greater')$N, 2000, tolerance = 1)
  # percent_B
  expect_equal(AB_t2n(N = 2000, mean_diff = .2, sd_A = 3,
                      sd_B = 2, sig_level = .05, power = 0.5570109,
                      alternative = 'greater')$percent_B, .4, tolerance = .01)
  # mean_diff
  expect_equal(AB_t2n(N = 2000, percent_B = .4, sd_A = 3,
                      sd_B = 2, sig_level = .05, power = 0.5570109,
                      alternative = 'greater')$mean_diff, .2, tolerance = .002)
})

### AB_t2n_prop tests

test_that("Output is consistent for AB_t2n_prop 'two_sided' test", {
  # power
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .12,
                           N = 10000, percent_B = .4,
                           sig_level = .05,
                           alternative = 'two_sided')$power, 0.8745193, tolerance = .01)
  # sig_level
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .12,
                           N = 10000, percent_B = .4,
                           power = 0.8745193,
                           alternative = 'two_sided')$sig_level, 0.05, tolerance = .002)
  # N
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .12,
                           percent_B = .4,
                           sig_level = .05, power = 0.8745193,
                           alternative = 'two_sided')$N, 10000, tolerance = 1)
  # percent_B
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .12,
                           N = 10000,
                           sig_level = .05, power = 0.8745193,
                           alternative = 'two_sided')$percent_B, .4, tolerance = .01)
  # prop_A
  expect_equal(AB_t2n_prop(prop_B = .12,
                           N = 10000, percent_B = .4,
                           sig_level = .05, power = 0.8745193,
                           alternative = 'two_sided')$prop_A[1], .1, tolerance = .002)
  # prop_B
  expect_equal(AB_t2n_prop(prop_A = .1,
                           N = 10000, percent_B = .4,
                           sig_level = .05, power = 0.8745193,
                           alternative = 'two_sided')$prop_B[2], .12, tolerance = .002)
})

test_that("Output is consistent for AB_t2n_prop 'less' test", {
  # power
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .06,
                           N = 1000, percent_B = .2,
                           sig_level = .05,
                           alternative = 'less')$power, 0.642594, tolerance = .01)
  # sig_level
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .06,
                           N = 1000, percent_B = .2,
                           power = 0.642594,
                           alternative = 'less')$sig_level, 0.05, tolerance = .002)
  # N
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .06,
                           percent_B = .2,
                           sig_level = .05, power = 0.642594,
                           alternative = 'less')$N, 1000, tolerance = 1)
  # percent_B
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .06,
                           N = 1000,
                           sig_level = .05, power = 0.642594,
                           alternative = 'less')$percent_B, .2, tolerance = .01)
  # prop_A
  expect_equal(AB_t2n_prop(prop_B = .06,
                           N = 1000, percent_B = .2,
                           sig_level = .05, power = 0.642594,
                           alternative = 'less')$prop_A, .1, tolerance = .002)
  # prop_B
  expect_equal(AB_t2n_prop(prop_A = .1,
                           N = 1000, percent_B = .2,
                           sig_level = .05, power = 0.642594,
                           alternative = 'less')$prop_B, .06, tolerance = .002)
})

test_that("Output is consistent for AB_t2n_prop 'greater' test", {
  # power
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .11,
                           N = 40000, percent_B = .2,
                           sig_level = .025,
                           alternative = 'greater')$power, 0.7315558, tolerance = .01)
  # sig_level
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .11,
                           N = 40000, percent_B = .2,
                           power = 0.7315558,
                           alternative = 'greater')$sig_level, 0.025, tolerance = .002)
  # N
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .11,
                           percent_B = .2,
                           sig_level = .025, power = 0.7315558,
                           alternative = 'greater')$N, 40000, tolerance = 1)
  # percent_B
  expect_equal(AB_t2n_prop(prop_A = .1, prop_B = .11,
                           N = 40000,
                           sig_level = .025, power = 0.7315558,
                           alternative = 'greater')$percent_B, .2, tolerance = .01)
  # prop_A
  expect_equal(AB_t2n_prop(prop_B = .11,
                           N = 40000, percent_B = .2,
                           sig_level = .025, power = 0.7315558,
                           alternative = 'greater')$prop_A, .1, tolerance = .002)
  # prop_B
  expect_equal(AB_t2n_prop(prop_A = .1,
                           N = 40000, percent_B = .2,
                           sig_level = .025, power = 0.7315558,
                           alternative = 'greater')$prop_B, .11, tolerance = .002)
})
