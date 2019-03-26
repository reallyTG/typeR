context("Differencing series")

test_that("dshift returns correct difference", {
  set.seed(1)
  expect_equal(round(dshift(arima.sim(model = list(), n = 10)), digits = 4), 
    round(c(NA, 0.8100971, -1.0192719, 2.4309094, 
      -1.2657730, -1.1499762, 1.3078974, 
      0.2508957, -0.1625434, -0.8811697), digits = 4))
})