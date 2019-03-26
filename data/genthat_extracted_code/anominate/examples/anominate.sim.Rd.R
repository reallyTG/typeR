library(anominate)


### Name: anominate.sim
### Title: alpha-NOMINATE Estimation on Simulated Roll Call Matrices
###   Generated with Normal (Gaussian) or Quadratic Utility
### Aliases: anominate.sim
### Keywords: ideal point estimation, NOMINATE, Bayesian latent variable
###   models

### ** Examples


## Don't show: 
quadratic.data <- anominate.sim(utility="quadratic") 
data(quad_anom)
summary(quad_anom)

normal.data <- anominate.sim(utility="normal") 
data(norm_anom)
summary(norm_anom)
## End(Don't show)

## Not run: 
##D quadratic.data <- anominate.sim(utility="quadratic") 
##D quad_anom <- anominate(quadratic.data, dims=1, polarity=2, nsamp=200, thin=1,
##D 	burnin=100, random.starts=FALSE, verbose=TRUE)
##D summary(quad_anom)
##D 
##D normal.data <- anominate.sim(utility="normal") 
##D norm_anom <- anominate(normal.data, dims=1, polarity=2, nsamp=200, thin=1, 
##D 	burnin=100, random.starts=FALSE, verbose=TRUE)
##D summary(norm_anom)
## End(Not run)




