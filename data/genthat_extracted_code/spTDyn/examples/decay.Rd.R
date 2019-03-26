library(spTDyn)


### Name: decay
### Title: Choice for sampling spatial decay parameter phi.
### Aliases: decay
### Keywords: spTDyn

### ** Examples

## 

# input for random-walk Metropolis within Gibbs 
# sampling for phi parameter
spatial.decay<-decay(distribution=Gamm(2,1), tuning=0.08)

# input for discrete sampling of phi parameter 
# with uniform prior distribution
spatial.decay<-decay(distribution=Unif(0.01,0.02),npoints=5)

# input for spatial decay if FIXED is used
spatial.decay<-decay(distribution="FIXED", value=0.01)

##



