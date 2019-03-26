library(SamplingStrata)


### Name: evalSolution
### Title: Evaluation of the solution produced by the function
###   'optimizeStrata' by selecting a number of samples from the frame with
###   the optimal stratification, and calculating average CV's on the
###   target variables Y's.
### Aliases: evalSolution
### Keywords: survey

### ** Examples

## Not run: 
##D library(SamplingStrata)
##D data(swisserrors)
##D data(swissstrata)
##D solution <- optimizeStrata (
##D 	errors = swisserrors,
##D 	strata = swissstrata,
##D )
##D # update sampling strata with new strata labels
##D newstrata <- updateStrata(swissstrata, solution, writeFiles = TRUE)
##D # update sampling frame with new strata labels
##D data(swissframe)
##D framenew <- updateFrame(frame=swissframe,newstrata=newstrata,writeFile=TRUE)
##D samp <- selectSample(framenew,solution$aggr_strata,writeFiles=TRUE)
##D # evaluate the current solution
##D results <- evalSolution(framenew, solution$aggr_strata, 10, cens=NULL, writeFiles = TRUE)
##D results$coeff_var
##D results$rel_bias
## End(Not run)



