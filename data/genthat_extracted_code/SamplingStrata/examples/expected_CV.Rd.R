library(SamplingStrata)


### Name: expected_CV
### Title: Expected coefficients of variation of target variables Y
### Aliases: expected_CV
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
##D # calculate CV's on Y's
##D expected_CV(solution$aggr_strata)
##D # compare to precision constraints
##D swisserrors
## End(Not run)



