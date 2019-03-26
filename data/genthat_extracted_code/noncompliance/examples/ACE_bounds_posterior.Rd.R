library(noncompliance)


### Name: ACE_bounds_posterior
### Title: Posterior bounds for the Average Causal Effect (ACE).
### Aliases: ACE_bounds_posterior

### ** Examples

ACE_bounds_posterior(158, 14, 0, 0, 52, 12, 23, 78,
     prior = c( rep(1, 2), rep(0, 2), rep(1, 4)))
ACE_bounds_posterior(158, 14, 0, 0, 52, 12, 23, 78,
     prior = c( rep(1/2, 2), rep(0, 2), rep(1/4, 4)))
## Not run: 
##D ace.bnds.lipid <- ACE_bounds_posterior(158, 14, 0, 0, 52, 12, 23, 78,
##D      prior = c( rep(1, 2), rep(0, 2), rep(1, 4)), num.sims = 2e4)
##D summary(ace.bnds.lipid) 
## End(Not run)



