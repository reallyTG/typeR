library(mixtools)


### Name: normalmixEM2comp
### Title: Fast EM Algorithm for 2-Component Mixtures of Univariate Normals
### Aliases: normalmixEM2comp
### Keywords: file

### ** Examples

##Analyzing the Old Faithful geyser data with a 2-component mixture of normals.

data(faithful)
attach(faithful)
set.seed(100)
system.time(out <- normalmixEM2comp(waiting, lambda=.5, 
            mu=c(50,80), sigsqrd=100))
out$all.loglik # Note:  must be monotone increasing

# Compare elapsed time with more general version
system.time(out2 <- normalmixEM(waiting, lambda=c(.5,.5), 
            mu=c(50,80), sigma=c(10,10), arbvar=FALSE))
out2$all.loglik # Values should be identical to above



