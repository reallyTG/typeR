context("2 Wholeplot, 1 Subplot")
dat <- EEG
dat$value2 <- exp(dat$value)

true_result <- c(3.035007, 116.290738, 2.672523, 1.657539)
result <- as.numeric(HRM::hrm_test(value ~ group*sex*dimension, subject = "subject", data = dat)$result[1, 2:5])
result1 <- as.numeric(HRM::hrm_test(value ~ group*sex*dimension, subject = subject, data = dat)$result[1, 2:5])


test_that("function hrm_test", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result1, true_result, tol = 1e-4)
})

true_result <- c(2.918698, 80.753833, 2.741836, 4.054007)
result <- as.numeric(HRM::hrm_test(value ~ group*sex*dimension, subject = "subject", data = dat, nonparametric = TRUE)$result[1, 2:5])
result1 <- as.numeric(HRM::hrm_test(value ~ group*sex*dimension, subject = subject, data = dat, nonparametric = TRUE)$result[1, 2:5])
result2 <- as.numeric(HRM::hrm_test(value2 ~ group*sex*dimension, subject = "subject", data = dat, nonparametric = TRUE)$result[1, 2:5])

test_that("function hrm_test, nonparametric", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result1, true_result, tol = 1e-4)
  expect_equal(result2, true_result, tol = 1e-4)
})
