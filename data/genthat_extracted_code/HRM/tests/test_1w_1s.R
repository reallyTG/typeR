context("1 Wholeplot, 1 Subplot")
true_result <- c(2.993584, 130.107638, 2.676095, 1.881486)
result <- as.numeric(HRM::hrm_test(value ~ group*dimension, subject = "subject", data = EEG)$result[1, 2:5])

test_that("function hrm_test", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_output(print(HRM::hrm_test(value ~ group*dimension, subject = "subject", data = EEG)))
  expect_output(summary(HRM::hrm_test(value ~ group*dimension, subject = "subject", data = EEG)))
  expect_equal(class(plot(HRM::hrm_test(value ~ group*dimension, subject = "subject", data = EEG))), c("gg", "ggplot"))
})

true_result <- c(3.077845, 137.450499, 2.648275, 5.318450)
dat <- EEG
dat$value2 <- exp(dat$value)
result <- as.numeric(HRM::hrm_test(value ~ group*dimension, subject = "subject", data = EEG, nonparametric = TRUE)$result[1, 2:5])
result2 <- as.numeric(HRM::hrm_test(value2 ~ group*dimension, subject = "subject", data = dat, nonparametric = TRUE)$result[1, 2:5])

test_that("function hrm_test, nonparametric", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result2, true_result, tol = 1e-4)
})

test_that("hrm_test interchange factors", {
  expect_equal(as.numeric(HRM::hrm_test(value~region*variable*group,data=EEG,subject="subject",nonparametric = T)$result[2,2:5]), as.numeric(HRM::hrm_test(value~variable*region*group,data=EEG,subject="subject",nonparametric = T)$result[3,2:5]), tol=1e-4)
  expect_equal(as.numeric(HRM::hrm_test(value~region*variable*group,data=EEG,subject="subject",nonparametric = F)$result[2,2:5]), as.numeric(HRM::hrm_test(value~variable*region*group,data=EEG,subject="subject",nonparametric = F)$result[3,2:5]), tol=1e-4)
})
