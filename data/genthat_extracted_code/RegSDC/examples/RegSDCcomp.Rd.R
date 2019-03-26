library(RegSDC)


### Name: RegSDCcomp
### Title: Regression-based SDC Tools - Component score correlation control
### Aliases: RegSDCcomp

### ** Examples

x <- matrix(1:10, 10, 1)
y <- matrix(rnorm(30) + 1:30, 10, 3)

# Same as IPSO (RegSDCipso)
RegSDCcomp(y, NA, x)

# Using QR and SVD
yQR <- RegSDCcomp(y, c(0.1, 0.2, NA), x)
ySVD <- RegSDCcomp(y, c(0.1, 0.2, NA), x, doSVD = TRUE)

# Calculation of residuals
r <- residuals(lm(y ~ x))
rQR <- residuals(lm(yQR ~ x))
rSVD <- residuals(lm(ySVD ~ x))

# Correlations for two first components as required
diag(cor(GenQR(r)$Q, GenQR(rQR)$Q))
diag(cor(GenQR(r, doSVD = TRUE)$Q, GenQR(rSVD, doSVD = TRUE)$Q))

# Identical covariance matrices
cov(yQR) - cov(ySVD)
cov(rQR) - cov(rSVD)

# Identical regression results
summary(lm(y[, 1] ~ x))
summary(lm(yQR[, 1] ~ x))
summary(lm(ySVD[, 1] ~ x))



