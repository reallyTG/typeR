library(BayesianTools)


### Name: plotDiagnostic
### Title: Diagnostic Plot
### Aliases: plotDiagnostic

### ** Examples

# Create bayesian setup with  
bayesianSetup <- createBayesianSetup(likelihood = testDensityNormal, 
                                     prior = createUniformPrior(lower = -10,
                                                                upper = 10))

# running MCMC

out = runMCMC(bayesianSetup = bayesianSetup)

# diagnostic plots
## Not run: 
##D plotDiagnostic(out)
## End(Not run)



