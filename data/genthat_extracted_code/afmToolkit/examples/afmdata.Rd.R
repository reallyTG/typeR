library(afmToolkit)


### Name: afmdata
### Title: AFM data
### Aliases: afmdata

### ** Examples

#Making some artifical data following a L-J 12-6 potential
n <- 1000
z <- seq(from = 9e-3, to = 1e-1, length.out = n )
u0 <- 1e-5
z0 <- 1e-2
Force <- -u0*(12*z0^6/z^7-12*z0^12/z^13)
Segment <- rep("approach",n)
AFMcurve <- afmdata(data.frame(Z = z, Force = Force, Segment  = Segment))
plot(AFMcurve)



