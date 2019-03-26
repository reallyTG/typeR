library(VGAM)


### Name: lms.bcn
### Title: LMS Quantile Regression with a Box-Cox Transformation to
###   Normality
### Aliases: lms.bcn
### Keywords: models regression

### ** Examples

## Not run: 
##D  require("VGAMdata")
##D mysubset <- subset(xs.nz, sex == "M" & ethnicity == "Maori" & study1)
##D mysubset <- transform(mysubset, BMI = weight / height^2)
##D BMIdata <- na.omit(mysubset)
##D BMIdata <- subset(BMIdata, BMI < 80 & age < 65,
##D                    select = c(age, BMI))  # Delete an outlier
##D summary(BMIdata)
##D 
##D fit <- vgam(BMI ~ s(age, df = c(4, 2)), lms.bcn(zero = 1), data = BMIdata)
##D 
##D par(mfrow = c(1, 2))
##D plot(fit, scol = "blue", se = TRUE)  # The two centered smooths
##D 
##D head(predict(fit))
##D head(fitted(fit))
##D head(BMIdata)
##D head(cdf(fit))  # Person 46 is probably overweight, given his age
##D 100 * colMeans(depvar(fit, drop = TRUE) < fitted(fit))  # Empirical proportions
##D 
##D # Convergence problems? Try this trick: fit0 is a simpler model used for fit1
##D fit0 <- vgam(BMI ~ s(age, df = 4), lms.bcn(zero = c(1, 3)), data = BMIdata)
##D fit1 <- vgam(BMI ~ s(age, df = c(4, 2)), lms.bcn(zero = 1), data = BMIdata,
##D             etastart = predict(fit0))
## End(Not run)

## Not run: 
##D # Quantile plot
##D par(bty = "l", mar = c(5, 4, 4, 3) + 0.1, xpd = TRUE)
##D qtplot(fit, percentiles = c(5, 50, 90, 99), main = "Quantiles",
##D        xlim = c(15, 66), las = 1, ylab = "BMI", lwd = 2, lcol = 4)
##D 
##D # Density plot
##D ygrid <- seq(15, 43, len = 100)  # BMI ranges
##D par(mfrow = c(1, 1), lwd = 2)
##D (aa <- deplot(fit, x0 = 20, y = ygrid, xlab = "BMI", col = "black",
##D   main = "Density functions at Age = 20 (black), 42 (red) and 55 (blue)"))
##D aa <- deplot(fit, x0 = 42, y = ygrid, add = TRUE, llty = 2, col = "red")
##D aa <- deplot(fit, x0 = 55, y = ygrid, add = TRUE, llty = 4, col = "blue",
##D              Attach = TRUE)
##D aa@post$deplot  # Contains density function values
## End(Not run)



