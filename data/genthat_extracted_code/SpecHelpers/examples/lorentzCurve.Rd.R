library(SpecHelpers)


### Name: lorentzCurve
### Title: Compute a Lorentzian Curve
### Aliases: lorentzCurve
### Keywords: distributions utilities

### ** Examples


myx <- seq(0, 100, length.out = 1000) # use lots of point for resolution
myy <- lorentzCurve(x = myx, area = 1, x0 = 40, gamma = 5)
plot(myx, myy, type = "l", main = "Pure Lorentzian Curve")
y = 0.5*max(myy)
x = seq(40, 45, 0.5)
points(x = x, y = rep(y, length(x)), col = "blue", type = "l")
text(x = 42, y = y + 0.005, labels = c("gamma"), col = "blue", srt = 90)




