context("hrm_test with matrices")

# number patients per group
n <- c(5,5)
# number of groups
a<-2
# number of variables
d<-2

# defining the list consisting of the samples from each group
X <- list(matrix(c(1.63512619, -0.46406855,0.34567845,  1.07325359, 0.05015165, -0.26875828, -0.28943747, -0.61755688, 1.13665826, 0.07511665),ncol=2, byrow=TRUE),
          matrix(c(-0.7200093, 0.4352615,2.8524930,  1.5989942,0.6883853,  0.2194638,-0.1553311,  1.4295960,-1.1304398, -0.7079807), ncol=2, byrow = TRUE))

true_result <- c(1.0000000, 6.2880223, 5.8563918, 0.1037361)
t_matrices <- hrm_test(data=X, alpha=0.05)
result <- as.numeric(t_matrices$result[1,2:5])

X[[1]] <- data.frame(value = vec(t(X[[1]])), group = 1, time = rep(1:d,n[1]))
X[[2]] <- data.frame(value = vec(t(X[[2]])), group = 2, time = rep(1:d,n[2]))
X <- rbind(X[[1]], X[[2]])
X$group <- as.factor(X$group)
X$subject <- gl(sum(n), d)

result2 <- as.numeric(hrm_test(value ~ group*time, data = X, subject = "subject")$result[1,2:5])

test_that("function hrm_test with matrices", {
  expect_equal(result, true_result, tol = 1e-4)
  expect_equal(result2, true_result, tol = 1e-4)
  expect_output(summary(t_matrices))
  expect_output(print(t_matrices))
  expect_equal(class(plot(t_matrices)), c("gg", "ggplot"))
})
