context("main function")

test_that("main function", {
  set.seed(314)
  x <- generate_train_data()
  fit <- sGMRFmix(x, K = 7, rho = 100)

  expected <- c("1"=0.5156696, "2"=0.4843304)
  expect_equal(fit$pi, expected, tolerance = 1e-7)
})

test_that("compute anomaly", {
  set.seed(314)
  x <- generate_train_data()
  fit <- sGMRFmix(x, K = 7, rho = 100)
  anomaly_score <- compute_anomaly_score(fit, generate_test_data())

  expect_equal(anomaly_score[1, 1], 0.7737825, tolerance = 1e-7)
})
