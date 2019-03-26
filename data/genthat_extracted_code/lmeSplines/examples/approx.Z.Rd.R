library(lmeSplines)


### Name: approx.Z
### Title: Interpolating in smoothing spline Z-matrix columns
### Aliases: approx.Z
### Keywords: manip

### ** Examples

times1 <- 1:10
Zt1 <- smspline(~ times1)
times2 <- seq(1,10,by=0.1)
Zt2 <- approx.Z(Zt1,oldtimes=times1,newtimes=times2)



