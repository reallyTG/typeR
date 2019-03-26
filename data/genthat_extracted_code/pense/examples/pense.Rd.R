library(pense)


### Name: pense
### Title: Penalized Elastic Net S-estimators for Regression
### Aliases: pense

### ** Examples

##
## A very simple example on artificial data
##

# Generate some dummy data
set.seed(12345)
n <- 30
p <- 15
x <- 1 + matrix(rnorm(n * p), ncol = p)
y <- x %*% c(2:5, numeric(p - 4)) + rnorm(n)

x_test <- matrix(rnorm(10 * n * p), ncol = p)
y_test <- x_test %*% c(2:5, numeric(p - 4)) + rnorm(n)

# Compute the S-estimator with an EN penalty for 30 lambda values
# (Note: In real applications, warm_reset should be at least 5)
set.seed(1234)
est <- pense(
    x, y,
    alpha = 0.6,
    nlambda = 20,
    warm_reset = 1L,
    cv_k = 3
)

# We can plot the CV prediction error curve
plot(est)

# What is the RMSPE on test data
(rmspe <- sqrt(mean((y_test - predict(est, newdata = x_test))^2)))

##
## What happens if we replace 5 observations in the dummy data
## with outliers?
##
y_out <- y
y_out[1:3] <- rnorm(3, -500)

# Compute the S-estimator again
# (Note: In real applications, warm_reset should be at least 5)
set.seed(12345)
est_out <- pense(
    x, y_out,
    alpha = 0.6,
    nlambda = 20,
    warm_reset = 1L,
    cv_k = 3
)

# How does the RMSPE compare?
rmspe_out <- sqrt(mean((y_test - predict(est_out, newdata = x_test))^2))
c(rmspe = rmspe, rmspe_out = rmspe_out)




