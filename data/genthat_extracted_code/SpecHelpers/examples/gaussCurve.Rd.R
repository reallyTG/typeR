library(SpecHelpers)


### Name: gaussCurve
### Title: Compute a Gaussian Curve
### Aliases: gaussCurve
### Keywords: utilities

### ** Examples


### A pure Gaussian curve

myx <- seq(0, 100, length.out = 1000) # use lots of point for resolution
myy <- gaussCurve(x = myx, area = 1, mu = 40, sigma = 1.5, tail = NA)
plot(myx, myy, type = "l", main = "Pure Gaussian Curve")

### Now with tailing

myy2 <- gaussCurve(x = myx, area = 1, mu = 40, sigma = 1.5, tail = 0.1)
plot(myx, myy2, type = "l", main = "Gaussian Curve with Tailing")




