library(RegSDC)


### Name: RegSDCipso
### Title: Regression-based SDC Tools - Ordinary synthetic data (IPSO)
### Aliases: RegSDCipso

### ** Examples

x <- matrix(1:5, 5, 1)
y <- matrix(rnorm(15) + 1:15, 5, 3)
ySynth <- RegSDCipso(y, x)

# Identical regression results
summary(lm(y[, 1] ~ x))
summary(lm(ySynth[, 1] ~ x))

# Identical covariance matrices
cov(y) - cov(ySynth)
cov(residuals(lm(y ~ x))) - cov(residuals(lm(ySynth ~ x)))



