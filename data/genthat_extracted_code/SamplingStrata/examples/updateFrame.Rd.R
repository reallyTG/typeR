library(SamplingStrata)


### Name: updateFrame
### Title: Updates the initial frame on the basis of the optimized
###   stratification
### Aliases: updateFrame
### Keywords: survey

### ** Examples

#
# The following example is realistic, but is time consuming
#
## Not run: 
##D library(SamplingStrata)
##D data(swisserrors)
##D data(swissstrata)
##D # optimisation of sampling strata
##D solution <- optimizeStrata ( 
##D     errors = swisserrors, 
##D     strata = swissstrata)
##D # updating sampling strata with new strata labels
##D newstrata <- updateStrata(swissstrata, solution, writeFiles = TRUE)
##D # updating sampling frame with new strata labels
##D data(swissframe)
##D framenew <- updateFrame(frame=swissframe, newstrata=newstrata, writeFiles = TRUE)
## End(Not run)



