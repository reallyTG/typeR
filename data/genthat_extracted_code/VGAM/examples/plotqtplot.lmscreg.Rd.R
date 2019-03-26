library(VGAM)


### Name: plotqtplot.lmscreg
### Title: Quantile Plot for LMS Quantile Regression
### Aliases: plotqtplot.lmscreg
### Keywords: graphs models regression

### ** Examples
## Not run: 
##D fit <- vgam(BMI ~ s(age, df = c(4,2)), lms.bcn(zero = 1), data = bmi.nz)
##D qtplot(fit)
##D qtplot(fit, perc = c(25,50,75,95), lcol = "blue", tcol = "blue", llwd = 2)
## End(Not run)



