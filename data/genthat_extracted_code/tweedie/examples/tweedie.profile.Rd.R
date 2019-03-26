library(tweedie)


### Name: tweedie.profile
### Title: Tweedie Distributions: mle estimation of p
### Aliases: tweedie.profile
### Keywords: models

### ** Examples

library(statmod) # Needed to use  tweedie.profile
# Generate some fictitious data
test.data <- rgamma(n=200, scale=1, shape=1)
# The gamma is a Tweedie distribution with power=2;
# let's see if p=2 is suggested by  tweedie.profile:
## Not run: 
##D 	out <- tweedie.profile( test.data ~ 1, 
##D 		p.vec=seq(1.5, 2.5, by=0.2) )
##D 	out$p.max
##D 	out$ci
## End(Not run)



