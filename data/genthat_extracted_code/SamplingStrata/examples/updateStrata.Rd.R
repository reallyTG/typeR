library(SamplingStrata)


### Name: updateStrata
### Title: Assigns new labels to atomic strata on the basis of the
###   optimized aggregated strata
### Aliases: updateStrata
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
##D # updating sampling strata with new strata labels
##D newstrata <- updateStrata(swissstrata, solution, writeFiles = TRUE)
## End(Not run)



