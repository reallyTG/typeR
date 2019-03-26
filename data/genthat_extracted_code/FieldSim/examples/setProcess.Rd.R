library(FieldSim)


### Name: setProcess
### Title: Construct usual processes on manifolds
### Aliases: setProcess

### ** Examples

# Load FieldSim library
library(FieldSim)

# Fractional Brownian field on [0,1]^2
plane.fBm<-setProcess("fBm-plane",0.7)
str(plane.fBm)

# Multifractional Brownian field on [0,1]^2
funcH<-function(xi){0.3+xi[1]*0.6}
plane.mBm<-setProcess("mBm-plane",funcH)
str(plane.mBm)

# Fractional Brownian sheet on [0,1]^2
#plane.fBs<-setProcess("fBs-plane",c(0.9,0.3))
#str(plane.fBs)

# Anisotropic fractional Brownian field on [0,1]^2
#plane.afBf<-setProcess("afBf-plane",list(H=0.7,theta1=pi/6,theta2=pi/3))
#str(plane.afBf)

# Bifractional fractional Brownian field on [0,1]^2
#plane.2pfBm<-setProcess("2pfBm-plane",list(H=0.7,K=0.5))
#str(plane.2pfBm)

# Spherical fractional Brownian field
#sphere.fBm<-setProcess("fBm-sphere",0.3)
#str(sphere.fBm)

# Fractional Brownian field on the hyperboloid
#hyper.fBm<-setProcess("fBm-hyperboloid",0.7)
#str(hyper.fBm)

# Bridge associated to the Fractional Brownian field on [0,1]^2
#Gamma<-matrix(c(1,0,0,0,1,1,1,1,1,1/2,1/2,0.5),3,4)
#bridge.plane.fBm<-setProcess("bridge-fBm-plane",list(Gamma=Gamma,par=0.9))
#str(bridge.plane.fBm)

# User defined process (see Brouste et al. 2010)

#sphere<-setManifold("sphere")
#user.sphere<-setProcess(name="user",manifold=sphere)

#parameter<-0.7
#acov<-function(xi,xj){exp(-#user.sphere@manifold@distance(xi,xj)^{2*user.sphere@parameter})}

#user.sphere@parameter<-parameter
#user.sphere@covf<-acov

#fieldsim(user.sphere)
#plot(user.sphere)



