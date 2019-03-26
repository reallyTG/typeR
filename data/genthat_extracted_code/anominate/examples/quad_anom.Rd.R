library(anominate)


### Name: quad_anom
### Title: alpha-NOMINATE Estimate, Simulated Roll Call Matrix using
###   Quadratic Utility
### Aliases: quad_anom
### Keywords: ideal point estimation, NOMINATE, Bayesian latent variable
###   models

### ** Examples


## Don't show: 
quadratic.data <- anominate.sim(utility="quadratic") 
data(quad_anom)
summary(quad_anom)
## End(Don't show)

## Not run: 
##D quadratic.data <- anominate.sim(utility="quadratic") 
##D quad_anom <- anominate(quadratic.data, dims=1, polarity=2, nsamp=200, thin=1, 
##D 	burnin=100, random.starts=FALSE, verbose=TRUE)
##D summary(quad_anom)
## End(Not run)




