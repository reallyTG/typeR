library(not)


### Name: residuals.not
### Title: Extract residuals from a 'not' object
### Aliases: residuals.not

### ** Examples

pcws.const.sig <- c(rep(0, 100), rep(1,100))
x <- pcws.const.sig + rnorm(100)
w <- not(x, contrast = "pcwsConstMean")
# *** plot residuals obtained via fitting piecewise-constant function with estimated change-points
plot(residuals(w))
# *** plot residuals with obtained via fitting piecewise-constant function with true change-point
plot(residuals(w, cpt=100))
# *** plot standardised residuals
plot(residuals(w, type="standardised"))



