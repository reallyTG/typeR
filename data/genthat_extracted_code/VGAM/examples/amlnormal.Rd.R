library(VGAM)


### Name: amlnormal
### Title: Asymmetric Least Squares Quantile Regression
### Aliases: amlnormal
### Keywords: models regression

### ** Examples

## Not run: 
##D # Example 1
##D ooo <- with(bmi.nz, order(age))
##D bmi.nz <- bmi.nz[ooo, ]  # Sort by age
##D (fit <- vglm(BMI ~ sm.bs(age), amlnormal(w.aml = 0.1), data = bmi.nz))
##D fit@extra  # Gives the w value and the percentile
##D coef(fit, matrix = TRUE)
##D 
##D # Quantile plot
##D with(bmi.nz, plot(age, BMI, col = "blue", main =
##D      paste(round(fit@extra$percentile, digits = 1),
##D            "expectile-percentile curve")))
##D with(bmi.nz, lines(age, c(fitted(fit)), col = "black"))
##D 
##D # Example 2
##D # Find the w values that give the 25, 50 and 75 percentiles
##D find.w <- function(w, percentile = 50) {
##D   fit2 <- vglm(BMI ~ sm.bs(age), amlnormal(w = w), data = bmi.nz)
##D   fit2@extra$percentile - percentile
##D }
##D # Quantile plot
##D with(bmi.nz, plot(age, BMI, col = "blue", las = 1, main =
##D      "25, 50 and 75 expectile-percentile curves"))
##D for (myp in c(25, 50, 75)) {
##D # Note: uniroot() can only find one root at a time
##D   bestw <- uniroot(f = find.w, interval = c(1/10^4, 10^4), percentile = myp)
##D   fit2 <- vglm(BMI ~ sm.bs(age), amlnormal(w = bestw$root), data = bmi.nz)
##D   with(bmi.nz, lines(age, c(fitted(fit2)), col = "orange"))
##D }
##D 
##D # Example 3; this is Example 1 but with smoothing splines and
##D # a vector w and a parallelism assumption.
##D ooo <- with(bmi.nz, order(age))
##D bmi.nz <- bmi.nz[ooo, ]  # Sort by age
##D fit3 <- vgam(BMI ~ s(age, df = 4), data = bmi.nz, trace = TRUE,
##D              amlnormal(w = c(0.1, 1, 10), parallel = TRUE))
##D fit3@extra  # The w values, percentiles and weighted deviances
##D 
##D # The linear components of the fit; not for human consumption:
##D coef(fit3, matrix = TRUE)
##D 
##D # Quantile plot
##D with(bmi.nz, plot(age, BMI, col="blue", main =
##D      paste(paste(round(fit3@extra$percentile, digits = 1), collapse = ", "),
##D            "expectile-percentile curves")))
##D with(bmi.nz, matlines(age, fitted(fit3), col = 1:fit3@extra$M, lwd = 2))
##D with(bmi.nz, lines(age, c(fitted(fit )), col = "black"))  # For comparison
## End(Not run)



