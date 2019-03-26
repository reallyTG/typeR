library(pense)


### Name: elnet_cv
### Title: Cross-validate Elastic Net
### Aliases: elnet_cv

### ** Examples

# Generate some dummy data
set.seed(12345)
n <- 30
p <- 15
x <- 1 + matrix(rnorm(n * p), ncol = p)
y <- x %*% c(2:5, numeric(p - 4)) + rnorm(n)

x_test <- matrix(rnorm(10 * n * p), ncol = p)
y_test <- drop(x_test %*% c(2:5, numeric(p - 4)) + rnorm(n))

# Compute the classical EN and select lambda based on CV
set.seed(1234)
est <- elnet_cv(
    x, y,
    alpha = 0.6,
    nlambda = 100
)

# The optimal lambda according to CV is
est$lambda_opt
plot(est)

# and the RMSPE at this lambda is
sqrt(mean((y_test - predict(est, x_test))^2))



