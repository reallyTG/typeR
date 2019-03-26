library(VGAM)


### Name: deplot.lmscreg
### Title: Density Plot for LMS Quantile Regression
### Aliases: deplot.lmscreg
### Keywords: graphs models regression

### ** Examples
## Not run: 
##D fit <- vgam(BMI ~ s(age, df = c(4, 2)), fam = lms.bcn(zero = 1), data = bmi.nz)
##D ygrid <- seq(15, 43, by = 0.25)
##D deplot(fit, x0 = 20, y = ygrid, xlab = "BMI", col = "green", llwd = 2,
##D        main = "BMI distribution at ages 20 (green), 40 (blue), 60 (red)")
##D deplot(fit, x0 = 40, y = ygrid, add = TRUE, col = "blue", llwd = 2)
##D deplot(fit, x0 = 60, y = ygrid, add = TRUE, col = "red", llwd = 2) -> a
##D 
##D names(a@post$deplot)
##D a@post$deplot$newdata
##D head(a@post$deplot$y)
##D head(a@post$deplot$density)
## End(Not run)



