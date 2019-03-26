context("1 Wholeplot, 2 Subplot")
dat <- EEG
dat$value2 <- exp(dat$value)

true_result <- c(2.779981, 95.003041, 2.768161, 1.657329)
result <- as.numeric(HRM::hrm_test(value ~ group*region*variable, subject = "subject", data = dat)$result[1, 2:5])

test_that("function hrm_test", {
  expect_equal(result, true_result, tol = 1e-4)
})

true_result <- c(2.915253, 107.301750, 2.714426, 4.249185)
result <- as.numeric(HRM::hrm_test(value ~ group*region*variable, subject = "subject", data = dat, nonparametric = TRUE)$result[1, 2:5])
result2 <- as.numeric(HRM::hrm_test(value2 ~ group*region*variable, subject = "subject", data = dat, nonparametric = TRUE)$result[1, 2:5])

test_that("function hrm_test, nonparametric", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result2, true_result, tol = 1e-4)
})