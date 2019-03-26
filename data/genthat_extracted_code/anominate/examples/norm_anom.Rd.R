library(anominate)


### Name: norm_anom
### Title: alpha-NOMINATE Estimate, Simulated Roll Call Matrix using Normal
###   Utility
### Aliases: norm_anom
### Keywords: ideal point estimation, NOMINATE, Bayesian latent variable
###   models

### ** Examples


## Don't show: 
normal.data <- anominate.sim(utility="normal") 
data(norm_anom)
summary(norm_anom)
## End(Don't show)

## Not run: 
##D normal.data <- anominate.sim(utility="normal") 
##D norm_anom <- anominate(normal.data, dims=1, polarity=2, nsamp=200, thin=1, 
##D 	burnin=100, random.starts=FALSE, verbose=TRUE)
##D summary(norm_anom)
## End(Not run)




