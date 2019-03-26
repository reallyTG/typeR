library(gsg)


### Name: gam.gradients
### Title: A function to calculate selection gradients from generalized
###   additive model-based characterizions of fitness functions.
### Aliases: gam.gradients
### Keywords: ~kwd1 ~kwd2

### ** Examples

# simulated data (stabilizing selection)
z<-rnorm(200,0,2)
W<-rpois(200,exp(1-0.3*z^2))
d<-as.data.frame(list(W=W,z=z))

# characterize the fitness function
library(mgcv)
ff<-gam(W~s(z),family='poisson',data=d)

# derive selection gradients
gam.gradients(mod=ff,phenotype="z",se.method='n',standardized=FALSE)$ests

# or gam.gradients() can be used to do the
# equivalent of a basic Lande and Arnold
# 1983 regression

LA<-gam(W~z+I(z^2),family='gaussian',data=d)
gam.gradients(mod=LA,phenotype="z",se.method='n',standardize=FALSE)$ests




