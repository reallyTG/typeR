context("test-lshift")

test_that("lshift returns correct difference for one lag", {
  set.seed(1)
  expect_equal(round(lshift(arima.sim(model = list(), n = 10), 1), digits = 4), 
    round(c(NA, -0.6264538, 0.1836433, -0.8356286, 
    1.5952808, 0.3295078, -0.8204684, 0.4874291,
    0.7383247, 0.5757814), digits = 4))
})

test_that("lshift returns correct difference for two lags", {
  set.seed(1)
  expect_equal(round(lshift(arima.sim(model = list(), n = 10), 2), digits = 4), 
               round(c(NA, NA, -0.6264538, 0.1836433, -0.8356286, 
                 1.5952808, 0.3295078, -0.8204684, 0.4874291,
                 0.7383247), digits = 4))
})
