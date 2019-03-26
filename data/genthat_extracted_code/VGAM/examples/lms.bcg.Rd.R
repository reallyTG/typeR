library(VGAM)


### Name: lms.bcg
### Title: LMS Quantile Regression with a Box-Cox transformation to a Gamma
###   Distribution
### Aliases: lms.bcg
### Keywords: models regression

### ** Examples

# This converges, but deplot(fit) and qtplot(fit) do not work
fit0 <- vglm(BMI ~ sm.bs(age, df = 4), lms.bcg, data = bmi.nz, trace = TRUE)
coef(fit0, matrix = TRUE)
## Not run: 
##D par(mfrow = c(1, 1))
##D plotvgam(fit0, se = TRUE)  # Plot mu function (only)
## End(Not run)

# Use a trick: fit0 is used for initial values for fit1.
fit1 <- vgam(BMI ~ s(age, df = c(4, 2)), etastart = predict(fit0),
             lms.bcg(zero = 1), bmi.nz, trace = TRUE)

# Difficult to get a model that converges.
# Here, we prematurely stop iterations because it fails near the solution.
fit2 <- vgam(BMI ~ s(age, df = c(4, 2)), maxit = 4,
             lms.bcg(zero = 1, ilam = 3), bmi.nz, trace = TRUE)
summary(fit1)
head(predict(fit1))
head(fitted(fit1))
head(bmi.nz)
# Person 1 is near the lower quartile of BMI amongst people his age
head(cdf(fit1))

## Not run: 
##D # Quantile plot
##D par(bty = "l", mar=c(5, 4, 4, 3) + 0.1, xpd = TRUE)
##D qtplot(fit1, percentiles=c(5, 50, 90, 99), main = "Quantiles",
##D        xlim = c(15, 90), las = 1, ylab = "BMI", lwd = 2, lcol = 4)
##D 
##D # Density plot
##D ygrid <- seq(15, 43, len = 100)  # BMI ranges
##D par(mfrow = c(1, 1), lwd = 2)
##D (aa <- deplot(fit1, x0 = 20, y = ygrid, xlab = "BMI", col = "black",
##D   main = "Density functions at Age = 20 (black), 42 (red) and 55 (blue)"))
##D aa <- deplot(fit1, x0=42, y=ygrid, add=TRUE, llty=2, col="red")
##D aa <- deplot(fit1, x0=55, y=ygrid, add=TRUE, llty=4, col="blue", Attach=TRUE)
##D aa@post$deplot  # Contains density function values
## End(Not run)



