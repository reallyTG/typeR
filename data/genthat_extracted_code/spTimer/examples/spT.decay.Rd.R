library(spTimer)


### Name: spT.decay
### Title: Choice for sampling spatial decay parameter phi.
### Aliases: spT.decay
### Keywords: spT

### ** Examples

## 

# input for random-walk Metropolis within Gibbs 
# sampling for phi parameter
spatial.decay<-spT.decay(distribution=Gamm(2,1), tuning=0.08)

# input for discrete sampling of phi parameter 
# with uniform prior distribution
spatial.decay<-spT.decay(distribution=Unif(0.01,0.02),npoints=5)

# input for spatial decay if FIXED is used
spatial.decay<-spT.decay(distribution="FIXED", value=0.01)

##



