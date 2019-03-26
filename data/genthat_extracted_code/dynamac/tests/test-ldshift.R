context("test-ldshift")

test_that("ldshift returns correct difference for one lag", {
  set.seed(1)
  expect_equal(round(ldshift(arima.sim(model = list(), n = 10), 1), digits = 4), 
               round(c(NA, NA, 0.8100971, -1.0192719, 2.4309094, 
                 -1.2657730, -1.1499762, 1.3078974, 
                 0.2508957, -0.1625434), digits = 4))
})

test_that("ldshift returns correct difference for two lags", {
  set.seed(1)
  expect_equal(round(ldshift(arima.sim(model = list(), n = 10), 2), digits = 4), 
               round(c(NA, NA, NA, 0.8100971, -1.0192719, 2.4309094, 
                 -1.2657730, -1.1499762, 1.3078974, 
                 0.2508957), digits = 4))
})


