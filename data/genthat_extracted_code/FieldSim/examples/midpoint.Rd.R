library(FieldSim)


### Name: midpoint
### Title: Fractional Brownian field simulation by the midpoint
###   displacement method
### Aliases: midpoint

### ** Examples

# load FieldSim library
library(FieldSim)

plane.fBm<-setProcess("fBm-plane",0.9)
midpoint(plane.fBm)
plot(plane.fBm)



