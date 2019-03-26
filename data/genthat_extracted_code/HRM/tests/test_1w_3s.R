context("1 Wholeplot, 3 Subplot")

dat <- EEG
dat$value2 <- exp(dat$value)
dat$factor1 <- as.factor(rep(1:2,3200))
dat$factor2 <- as.factor(rep(c(1,1,2,2),1600))
dat$factor3 <- as.factor(rep(kronecker(1:10, rep(1,4)), 160))

true_result <- c(2.779981, 95.003041, 2.768161, 1.657329)
result <- as.numeric(HRM::hrm_test(value ~ group*factor1*factor2*factor3, subject = "subject", data = dat)$result[1, 2:5])

result_hrm <- HRM::hrm_test(value ~ group*factor1*factor2*factor3, subject = "subject", data = dat)

test_that("function hrm_test", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_output(print(result_hrm))
  expect_output(summary(result_hrm))
})


true_result <- c(2.915253, 107.301750, 2.714426, 4.249185)
result_hrm <- HRM::hrm_test(value ~ group*factor1*factor2*factor3, subject = "subject", data = dat, nonparametric = TRUE)
result <- as.numeric(result_hrm$result[1, 2:5])
result_hrm <- HRM::hrm_test(value ~ factor2*group*factor1*factor3, subject = "subject", data = dat, nonparametric = TRUE)
result2 <- as.numeric(result_hrm$result[1, 2:5])


test_that("function hrm_test nonparametric", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result2, true_result, tol = 1e-4)
  expect_output(print(result_hrm))
  expect_output(summary(result_hrm))
})
