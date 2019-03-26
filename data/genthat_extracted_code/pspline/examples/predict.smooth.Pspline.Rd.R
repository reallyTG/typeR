library(pspline)


### Name: predict.smooth.Pspline
### Title: Smoothing Spline of Arbitrary Order at New Data
### Aliases: predict.smooth.Pspline
### Keywords: smooth

### ** Examples

example(smooth.Pspline)
## smoother line is given by
xx <- seq(4, 25, length=100)
lines(xx, predict(sm.spline(speed, dist, df=5), xx), col = "red")
## add plots of derivatives
lines(xx, 10*predict(sm.spline(speed, dist), xx, 1), col = "blue")
lines(xx, 100*predict(sm.spline(speed, dist), xx, 2), col = "green")



