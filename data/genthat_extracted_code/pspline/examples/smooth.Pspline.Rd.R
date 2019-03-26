library(pspline)


### Name: smooth.Pspline
### Title: Fit a Polynomial Smoothing Spline of Arbitrary Order
### Aliases: smooth.Pspline lines.smooth.Pspline plot.smooth.Pspline
###   print.smooth.Pspline sm.spline
### Keywords: smooth

### ** Examples

data(cars)
attach(cars)
plot(speed, dist, main = "data(cars)  &  smoothing splines")
cars.spl <- sm.spline(speed, dist)
cars.spl
lines(cars.spl, col = "blue")
lines(sm.spline(speed, dist, df=10), lty=2, col = "red")



