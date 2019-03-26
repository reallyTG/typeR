library(FieldSim)


### Name: fieldsim
### Title: Simulate manifold indexed Gaussian field by the Fieldsim method
### Aliases: fieldsim

### ** Examples

# Load FieldSim library
library(FieldSim)

# Fractional Brownian field on [0,1]^2
plane.fBm<-setProcess("fBm-plane",0.7)
str(plane.fBm)
fieldsim(plane.fBm)
plot(plane.fBm)

# Sphere indexed fractional Brownian field
#sphere.fBm<-setProcess("fBm-sphere",0.3)
#fieldsim(sphere.fBm)
#plot(sphere.fBm)

# Bridge associated to the Fractional Brownian field on [0,1]^2
#Gamma<-matrix(c(1,0,0,0,1,1,1,1,1,1/2,1/2,0.5),3,4)
#bridge.plane.fBm<-setProcess("bridge-fBm-plane",list(Gamma=Gamma,par=0.9))
#fieldsim(bridge.plane.fBm)
#plot(bridge.plane.fBm)

# Other examples can be found in the setProcess documentation.



