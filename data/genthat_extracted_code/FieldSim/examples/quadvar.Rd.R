library(FieldSim)


### Name: quadvar
### Title: Estimate the Hurst parameter of a plane indexed fractional
###   Brownian field by the quadratic variations method
### Aliases: quadvar

### ** Examples

# load FieldSim library
library(FieldSim)

# Simulated Fractional Brownian field on [0,1]^2
plane.fBm<-setProcess("fBm-plane",0.7)
fieldsim(plane.fBm)
quadvar(plane.fBm)

# Simulated Multifractional Brownian field on [0,1]^2
funcH<-function(xi){0.3+xi[1]*0.6}
plane.mBm<-setProcess("mBm-plane",funcH)
fieldsim(plane.mBm)
quadvar(plane.mBm,parameter=list(point=c(0.5,0.5),h=0.2))



