library(splines2)


### Name: mSpline
### Title: M-Spline Basis for Polynomial Splines and its Derivatives
### Aliases: mSpline

### ** Examples

## Example given in the reference paper by Ramsay (1988)
library(splines2)
x <- seq.int(0, 1, 0.01)
knots <- c(0.3, 0.5, 0.6)
msMat <- mSpline(x, knots = knots, degree = 2, intercept = TRUE)

library(graphics)
matplot(x, msMat, type = "l", ylab = "M-spline basis")
abline(v = knots, lty = 2, col = "gray")

## derivatives of M-splines
dmsMat <- mSpline(x, knots = knots, degree = 2,
                  intercept = TRUE, derivs = 1)
## or using the 'deriv' method
dmsMat1 <- deriv(msMat)
stopifnot(all.equal(dmsMat, dmsMat1, check.attributes = FALSE))



