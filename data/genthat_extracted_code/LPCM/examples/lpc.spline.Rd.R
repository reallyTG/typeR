library(LPCM)


### Name: lpc.spline
### Title: Representing local principal curves through a cubic spline.
### Aliases: lpc.spline
### Keywords: smooth multivariate

### ** Examples

data(gvessel)
gvessel.lpc <- lpc(gvessel[,c(2,4,5)],   h=0.11,  x0=c(35, 1870, 6.3))
gvessel.spline  <- lpc.spline(gvessel.lpc)
plot(gvessel.spline, lwd=2)



