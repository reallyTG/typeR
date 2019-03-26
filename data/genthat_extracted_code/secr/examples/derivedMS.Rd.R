library(secr)


### Name: derived
### Title: Derived Parameters of Fitted SECR Model
### Aliases: derived esa derived.secr derived.secrlist
### Keywords: models

### ** Examples


## Not run: 
##D ## extract derived parameters from a model fitted previously
##D ## by maximizing the conditional likelihood 
##D derived (secrdemo.CL)
##D 
##D ## what happens when sampling variance is conditional on mask N?
##D derived(secrdemo.CL, distribution = "binomial")
##D ## fitted g0, sigma
##D esa(secrdemo.CL)
##D ## force different g0, sigma
##D esa(secrdemo.CL, real = c(0.2, 25))
## End(Not run)




