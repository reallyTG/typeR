context("0 Wholeplot, 1 Subplot")
dat <- subset(EEG, EEG$dimension == 1)
dat$value2 <- exp(dat$value)

true_result <- c(2.922247, 105.176637, 2.714045, 1.438108)
result <- as.numeric(HRM::hrm_test(value ~ group, subject = "subject", data = dat)$result[1, 2:5])

test_that("function hrm_test", {
  expect_equal(result, true_result, tol = 1e-4)
})

true_result <- c(2.966951, 115.96990, 2.692519, 1.634743)
result <- as.numeric(HRM::hrm_test(value ~ group, subject = "subject", data = dat, nonparametric = TRUE)$result[1, 2:5])
result2 <- as.numeric(HRM::hrm_test(value2 ~ group, subject = "subject", data = dat, nonparametric = TRUE)$result[1, 2:5])

test_that("function hrm_test, nonparametric", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result2, true_result, tol = 1e-4)
})