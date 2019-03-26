library(BayesianTools)


### Name: createPriorDensity
### Title: Fits a density function to a multivariate sample
### Aliases: createPriorDensity

### ** Examples

# Create a BayesianSetup
ll <- generateTestDensityMultiNormal(sigma = "no correlation")
bayesianSetup = createBayesianSetup(likelihood = ll, 
                                    lower = rep(-10, 3), 
                                    upper = rep(10, 3))

settings = list(iterations = 1000)
out <- runMCMC(bayesianSetup = bayesianSetup, settings = settings)


newPrior = createPriorDensity(out, method = "multivariate",
                              eps = 1e-10, lower = rep(-10, 3),
                              upper =  rep(10, 3), best = NULL)

bayesianSetup <- createBayesianSetup(likelihood = ll, prior = newPrior)

## Not run: 
##D   settings = list(iterations = 1000)
##D   out <- runMCMC(bayesianSetup = bayesianSetup, settings = settings)
## End(Not run)






