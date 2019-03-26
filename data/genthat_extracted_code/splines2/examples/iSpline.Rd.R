library(splines2)


### Name: iSpline
### Title: I-Spline Basis for Polynomial Splines or its derivatives
### Aliases: iSpline

### ** Examples

## Example given in the reference paper by Ramsay (1988)
library(splines2)
x <- seq.int(0, 1, by = 0.01)
knots <- c(0.3, 0.5, 0.6)
isMat <- iSpline(x, knots = knots, degree = 2, intercept = TRUE)

library(graphics)
matplot(x, isMat, type = "l", ylab = "I-spline basis")
abline(v = knots, lty = 2, col = "gray")

## the derivative of I-splines is M-spline
msMat1 <- iSpline(x, knots = knots, degree = 2, derivs = 1)
msMat2 <- mSpline(x, knots = knots, degree = 2)
stopifnot(all.equal(msMat1, msMat2))



