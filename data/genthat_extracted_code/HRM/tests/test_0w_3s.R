context("0 Wholeplot, 3 Subplot")

dat <- EEG
dat$value2 <- exp(dat$value)
dat$factor1 <- as.factor(rep(1:2,3200))
dat$factor2 <- as.factor(rep(c(1,1,2,2),1600))
dat$factor3 <- as.factor(rep(kronecker(1:10, rep(1,4)), 160))

true_result <- c(1.000000, 159.0000, 3.900610, 0.5922840)
result <- as.numeric(HRM::hrm_test(value ~ factor1*factor2*factor3, subject = "subject", data = dat)$result[1, 2:5])
result2 <- as.numeric(HRM::hrm_test(value ~ factor3*factor2*factor1, subject = "subject", data = dat)$result[3, 2:5])
result_CI <- c(1, 1, 1, 3.9380174, 3.802278, 4.073756)
result_hrm <- HRM::hrm_test(value ~ factor1*factor2*factor3, subject = "subject", data = dat)

set.seed(0)
test_that("function hrm_test", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result2, true_result, tol = 1e-4)
  expect_output(print(result_hrm))
  expect_output(summary(result_hrm))
  expect_equivalent(as.numeric(confint(HRM::hrm_test(value ~ factor3*factor2*factor1, subject = "subject", data = dat))[1, ]), result_CI, tol=1e-4)
})


true_result <- c(1.000000, 159.0000, 3.90061004, 0.03224197)
result <- as.numeric(HRM::hrm_test(value ~ factor1*factor2*factor3, subject = "subject", data = dat, nonparametric = TRUE)$result[1, 2:5])
result2 <- as.numeric(HRM::hrm_test(value2 ~ factor3*factor2*factor1, subject = "subject", data = dat, nonparametric = TRUE)$result[3, 2:5])
result_CI <- c(1, 1, 1, 0.91993262, 0.9196157, 0.9202495)
result_hrm <- HRM::hrm_test(value ~ factor1*factor2*factor3, subject = "subject", data = dat, nonparametric = TRUE)

set.seed(0)
test_that("function hrm_test nonparametric", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result2, true_result, tol = 1e-4)
  expect_output(print(result_hrm))
  expect_output(summary(result_hrm))
  expect_equivalent(as.numeric(confint(HRM::hrm_test(value ~ factor3*factor2*factor1, subject = "subject", data = dat, nonparametric = TRUE))[1, ]), result_CI, tol=1e-4)
})