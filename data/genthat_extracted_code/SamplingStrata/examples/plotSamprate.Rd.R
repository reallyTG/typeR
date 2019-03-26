library(SamplingStrata)


### Name: plotSamprate
### Title: Plotting sampling rates in the different strata for each domain
###   in the solution.
### Aliases: plotSamprate
### Keywords: survey

### ** Examples

## Not run: 
##D library(SamplingStrata)
##D data(swisserrors)
##D data(swissstrata)
##D # optimisation of sampling strata
##D solution <- optimizeStrata ( 
##D     errors = swisserrors, 
##D     strata = swissstrata, 
##D )
##D # plot of the sampling rates in strata 
##D for (i in (1:length(unique(swissstrata$DOM1)))) plotSamprate(solution, i)
## End(Not run)



