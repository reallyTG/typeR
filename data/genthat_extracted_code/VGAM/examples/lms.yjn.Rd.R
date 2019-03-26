library(VGAM)


### Name: lms.yjn
### Title: LMS Quantile Regression with a Yeo-Johnson Transformation to
###   Normality
### Aliases: lms.yjn lms.yjn2
### Keywords: models regression

### ** Examples

fit <- vgam(BMI ~ s(age, df = 4), lms.yjn, bmi.nz, trace = TRUE)
head(predict(fit))
head(fitted(fit))
head(bmi.nz)
# Person 1 is near the lower quartile of BMI amongst people his age
head(cdf(fit))

## Not run: 
##D # Quantile plot
##D par(bty = "l", mar = c(5, 4, 4, 3) + 0.1, xpd = TRUE)
##D qtplot(fit, percentiles = c(5, 50, 90, 99), main = "Quantiles",
##D        xlim = c(15, 90), las = 1, ylab = "BMI", lwd = 2, lcol = 4)
##D 
##D # Density plot
##D ygrid <- seq(15, 43, len = 100)  # BMI ranges
##D par(mfrow = c(1, 1), lwd = 2)
##D (aa <- deplot(fit, x0 = 20, y = ygrid, xlab = "BMI", col = "black",
##D     main = "Density functions at Age = 20 (black), 42 (red) and 55 (blue)"))
##D aa <- deplot(fit, x0 = 42, y = ygrid, add = TRUE, llty = 2, col = "red")
##D aa <- deplot(fit, x0 = 55, y = ygrid, add = TRUE, llty = 4, col = "blue",
##D              Attach = TRUE)
##D with(aa@post, deplot)  # Contains density function values; == a@post$deplot
## End(Not run)



