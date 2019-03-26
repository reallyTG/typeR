library(tis)


### Name: linearSplineIntegration
### Title: Linear Spline Integration
### Aliases: ilspline lintegrate
### Keywords: math

### ** Examples

w <- 10 + cumsum(rnorm(10))
blah <- ilspline(1:11, w)
ww <- lintegrate(blah$x, blah$y, 1:11, rule = 1)
w - ww  ## should be all zeroes (or very close to zero)



