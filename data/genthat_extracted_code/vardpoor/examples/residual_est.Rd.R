library(vardpoor)


### Name: residual_est
### Title: Residual estimation of calibration
### Aliases: residual_est
### Keywords: survey

### ** Examples

Y <- matrix(rchisq(10, 3), 10, 1)
X <- matrix(rchisq(20, 3), 10, 2)
w <- rep(2, 10)
q <- rep(1, 10)
residual_est(Y, X, w, q)

### Test2
Y <- matrix(rchisq(10, 3), 10, 1)
X <- matrix(c(rchisq(10, 2), rchisq(10, 2) + 10), 10, 2)
w <- rep(2, 10)
q <- rep(1, 10)
residual_est(Y, X, w, q)
as.matrix(lm(Y ~ X - 1, weights = w * q)$residuals)



