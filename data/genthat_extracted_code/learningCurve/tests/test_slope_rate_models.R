test_that("natural_slope computes appropriately", {
  
  expect_that(round(natural_slope(r = c(.80, .85, .90)), 2), equals(c(-0.32, -0.23, -0.15)))
  expect_that(round(natural_slope(r = c(.75, .90, .95)), 2), equals(c(-0.42, -0.15, -0.07)))
  expect_that(natural_slope(r = ".95"), throws_error())
  expect_that(natural_slope(r = -.1), gives_warning())
  
})

test_that("lc_rate computes appropriately", {
  
  expect_that(round(lc_rate(b = c(-.19, -.22, -.25)), 2), equals(c(0.88, 0.86, 0.84)))
  expect_that(round(lc_rate(b = c(-.16, -.27, -.35)), 2), equals(c(0.90, 0.83, 0.78)))
  expect_that(lc_rate(b = "-.27"), throws_error())
  
})

test_that("natural_slope_est computes appropriately", {
  
  expect_that(round(natural_slope_est(T = 8250, t = 80, n = 250), 2), equals(-0.16))
  expect_that(round(natural_slope_est(T = 6000, t = 55, n = 325), 2), equals(-0.19))
  expect_that(natural_slope_est(T = "6000", t = 55, n = 325), throws_error())
  
})

test_that("lc_rate_est computes appropriately", {
  
  expect_that(round(lc_rate_est(T = 8250, t = 80, n = 250), 2), equals(0.89))
  expect_that(round(lc_rate_est(T = 6500, t = 250, n = 427), 2), equals(0.73))
  expect_that(lc_rate_est(T = "8250", t = 80, n = 250), throws_error())
  
})