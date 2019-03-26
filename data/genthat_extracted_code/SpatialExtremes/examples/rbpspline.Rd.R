library(SpatialExtremes)


### Name: rbpspline
### Title: Fits a penalized spline with radial basis functions to data
### Aliases: rbpspline
### Keywords: htest

### ** Examples

n <- 200
x <- runif(n)
fun <- function(x) sin(3 * pi * x)
y <- fun(x) + rnorm(n, 0, sqrt(0.4))
knots <- quantile(x, prob = 1:(n/4) / (n/4 + 1))
fitted <- rbpspline(y, x, knots = knots, degree = 3)
fitted

plot(x, y)
lines(fitted, col = 2)



