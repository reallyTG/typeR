library(VGAM)


### Name: plotdeplot.lmscreg
### Title: Density Plot for LMS Quantile Regression
### Aliases: plotdeplot.lmscreg
### Keywords: dplot models regression

### ** Examples

fit <- vgam(BMI ~ s(age, df = c(4,2)), lms.bcn(zero = 1), bmi.nz)
## Not run: 
##D  y = seq(15, 43, by = 0.25)
##D deplot(fit, x0 = 20, y = y, xlab = "BMI", col = "green", llwd = 2,
##D        main = "BMI distribution at ages 20 (green), 40 (blue), 60 (orange)")
##D deplot(fit, x0 = 40, y = y, add = TRUE, col = "blue", llwd = 2)
##D deplot(fit, x0 = 60, y = y, add = TRUE, col = "orange", llwd = 2) -> aa
##D 
##D names(aa@post$deplot)
##D aa@post$deplot$newdata
##D head(aa@post$deplot$y)
##D head(aa@post$deplot$density) 
## End(Not run)



