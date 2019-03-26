library(FieldSim)


### Name: plot
### Title: Generic plotting of specific manifold indexed fractional
###   Gaussian processes
### Aliases: plot

### ** Examples

# Load FieldSim library
library(FieldSim)

# Fractional Brownian field on [0,1]^2
plane.fBm<-setProcess("fBm-plane",0.7)
str(plane.fBm)
fieldsim(plane.fBm)
plot(plane.fBm)

#The "cloud" plotting
plot(plane.fBm,"cloud")

#The "sun" plotting
plot(plane.fBm,"sun")

# Sphere indexed fractional Brownian field
#sphere.fBm<-setProcess("fBm-sphere",0.3)
#fieldsim(sphere.fBm)
#plot(sphere.fBm)



