library(SamplingStrata)


### Name: KmeansSolution
### Title: Initial solution obtained by applying kmeans clustering of
###   atomic strata
### Aliases: KmeansSolution
### Keywords: survey

### ** Examples

## Not run: 
##D library(SamplingStrata)
##D data(swisserrors)
##D data(swissstrata)
##D 
##D # suggestion
##D solutionKmean <- KmeansSolution(strata=swissstrata,
##D 								errors=swisserrors,
##D 								nstrata=NA,
##D 								showPlot=TRUE)
##D 
##D # optimisation of sampling strata
##D solution <- optimizeStrata ( 
##D   errors = swisserrors, 
##D   strata = swissstrata, 
##D   suggestions = solutionKmean
##D )
## End(Not run)



