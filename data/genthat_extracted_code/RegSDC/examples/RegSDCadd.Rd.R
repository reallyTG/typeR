library(RegSDC)


### Name: RegSDCadd
### Title: Regression-based SDC Tools - Synthetic addition with residual
###   correlation control
### Aliases: RegSDCadd

### ** Examples

x <- matrix(1:10, 10, 1)
y <- matrix(rnorm(30) + 1:30, 10, 3)
yOut <- RegSDCadd(y, c(0.1, 0.2, 0.3), x)

# Correlations between residuals as required
diag(cor(residuals(lm(y ~ x)), residuals(lm(yOut ~ x))))

# Identical covariance matrices
cov(y) - cov(yOut)
cov(residuals(lm(y ~ x))) - cov(residuals(lm(yOut ~ x)))

# Identical regression results
summary(lm(y[, 1] ~ x))
summary(lm(yOut[, 1] ~ x))

# alpha as attribute
attr(yOut, "alpha")

# With yStart as input and alpha limit in use (warning produced)
yOut <- RegSDCadd(y, NULL, x, 2 * y + matrix(rnorm(30), 10, 3))
attr(yOut, "alpha")

# Same correlation for all variables
RegSDCadd(y, 0.2, x)
# But in this case RegSDCcomp is equivalent and faster
RegSDCcomp(y, 0.2, x)


# Make nearly collinear data
y[, 3] <- y[, 1] + y[, 2] + 0.001 * y[, 3]
# Not possible to achieve correlations. Small alpha with warning.
RegSDCadd(y, c(0.1, 0.2, 0.3), x)
# Exact collinear data
y[, 3] <- y[, 1] + y[, 2]
# Zero alpha with warning
RegSDCadd(y, c(0.1, 0.2, 0.3), x)



