context("0 Wholeplot, 1 Subplot")
true_result <- c(2.435676, 387.272412, 2.819387, 3130.740306)
result <- as.numeric(HRM::hrm_test(value ~ dimension, subject = "subject", data = EEG)$result[1, 2:5])
result_CI <- c(1,  3.9380174,  3.802278, 4.073756)

set.seed(0)
test_that("function hrm_test", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equivalent(as.numeric(confint(HRM::hrm_test(value ~ dimension, subject = "subject", data = EEG))[1, ]), result_CI, tol=1e-4)
})


dat <- EEG
dat$value2 <- exp(dat$value)
true_result <- c(3.541978, 563.174494, 2.481990, 2307.117289)
result <- as.numeric(HRM::hrm_test(value ~ dimension, subject = "subject", data = EEG, nonparametric = TRUE)$result[1, 2:5])
result2 <- as.numeric(HRM::hrm_test(value2 ~ dimension, subject = "subject", data = dat, nonparametric = TRUE)$result[1, 2:5])
result_CI <- c(1, 0.91993262, 0.9196157, 0.9202495)

set.seed(0)
test_that("function hrm_test, nonparametric", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result2, true_result, tol = 1e-4)
  expect_equivalent(as.numeric(confint(HRM::hrm_test(value ~ dimension, subject = "subject", data = EEG, nonparametric=TRUE))[1, ]), result_CI, tol=1e-4)
})
