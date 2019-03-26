library(SpatialExtremes)


### Name: cv
### Title: Estimates the penalty coefficient from the cross-validation
###   criterion
### Aliases: cv
### Keywords: htest

### ** Examples

n <- 200
x <- runif(n)
fun <- function(x) sin(3 * pi * x)
y <- fun(x) + rnorm(n, 0, sqrt(0.4))
knots <- quantile(x, prob = 1:(n/4) / (n/4 + 1))
cv(y, x, knots = knots, degree = 3)



