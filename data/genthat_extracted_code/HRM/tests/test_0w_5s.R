context("0 Wholeplot, 4 Subplot")

n <- 5
l <- rep(list(1:2), n)
l <- expand.grid(l)

set.seed(0)
df <- data.frame(subject = gl(10,32), value = rnorm(320)) 
df <- cbind(df, l)

true_result <- c(1.0000000, 9.0000000, 5.1173550, 0.2200456)
result <- as.numeric(HRM::hrm_test(value~Var1*Var2*Var3*Var4*Var5, data = df, subject = "subject")$result[1, 2:5])

result_hrm <- HRM::hrm_test(value~Var1*Var2*Var3*Var4*Var5, data = df, subject = "subject")

test_that("function hrm_test", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_output(print(result_hrm))
  expect_output(summary(result_hrm))
  expect_error(HRM::hrm_test(value~Var1*Var2*Var3, data = df, subject = "subject"))
})


true_result <- c(1.0000000, 9.0000000, 5.11735503, 0.03332442)
df$value2 <- exp(df$value)
result <- as.numeric(HRM::hrm_test(value~Var1*Var2*Var3*Var4*Var5, data = df, subject = "subject", nonparametric = TRUE)$result[1, 2:5])
result2 <- as.numeric(HRM::hrm_test(value2~Var1*Var2*Var3*Var4*Var5, data = df, subject = "subject", nonparametric = TRUE)$result[1, 2:5])
result_hrm <- HRM::hrm_test(value~Var1*Var2*Var3*Var4*Var5, data = df, subject = "subject", nonparametric = TRUE)

test_that("function hrm_test nonparametric", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result, result2, tol = 1e-4)
  expect_output(print(result_hrm))
  expect_output(summary(result_hrm))
  expect_error(HRM::hrm_test(value~Var1*Var2*Var3, data = df, subject = "subject", nonparametric = TRUE))
})