library(sandwich)


### Name: vcovHC
### Title: Heteroskedasticity-Consistent Covariance Matrix Estimation
### Aliases: vcovHC vcovHC.default vcovHC.mlm meatHC
### Keywords: regression ts

### ** Examples

## generate linear regression relationship
## with homoskedastic variances
x <- sin(1:100)
y <- 1 + x + rnorm(100)
## model fit and HC3 covariance
fm <- lm(y ~ x)
vcovHC(fm)
## usual covariance matrix
vcovHC(fm, type = "const")
vcov(fm)

sigma2 <- sum(residuals(lm(y ~ x))^2)/98
sigma2 * solve(crossprod(cbind(1, x)))



