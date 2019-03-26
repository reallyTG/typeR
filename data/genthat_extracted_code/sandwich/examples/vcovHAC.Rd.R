library(sandwich)


### Name: vcovHAC
### Title: Heteroskedasticity and Autocorrelation Consistent (HAC)
###   Covariance Matrix Estimation
### Aliases: vcovHAC vcovHAC.default meatHAC
### Keywords: regression ts

### ** Examples

x <- sin(1:100)
y <- 1 + x + rnorm(100)
fm <- lm(y ~ x)
vcovHAC(fm)
vcov(fm)



