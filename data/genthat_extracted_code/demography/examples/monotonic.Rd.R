library(demography)


### Name: cm.spline
### Title: Monotonic interpolating splines
### Aliases: cm.spline cm.splinefun
### Keywords: smooth

### ** Examples

x <- seq(0,4,l=20)
y <- sort(rnorm(20))
plot(x,y)
lines(spline(x, y, n = 201), col = 2) # Not necessarily monotonic
lines(cm.spline(x, y, n = 201), col = 3) # Monotonic



