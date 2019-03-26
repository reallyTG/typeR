library(VGAM)


### Name: cdf.lmscreg
### Title: Cumulative Distribution Function for LMS Quantile Regression
### Aliases: cdf.lmscreg
### Keywords: models regression

### ** Examples

fit <- vgam(BMI ~ s(age, df=c(4, 2)), lms.bcn(zero = 1), data = bmi.nz)
head(fit@post$cdf)
head(cdf(fit))  # Same
head(depvar(fit))
head(fitted(fit))

cdf(fit, data.frame(age = c(31.5, 39), BMI = c(28.4, 24)))



