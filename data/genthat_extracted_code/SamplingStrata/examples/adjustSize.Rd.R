library(SamplingStrata)


### Name: adjustSize
### Title: Adjustment of the sample size in case it is externally given
### Aliases: adjustSize
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
##D # 
##D sum(solution$aggr_strata$SOLUZ)
##D # Adjustment of total sample size (decreasing)
##D adjustedStrata <- adjustSize(size=300,strata=solution$aggr_strata,cens=NULL)
##D sum(adjustedStrata$SOLUZ)
##D # Adjustment of total sample size (increasing)
##D adjustedStrata <- adjustSize(size=500,strata=solution$aggr_strata,cens=NULL)
##D sum(adjustedStrata$SOLUZ)
## End(Not run)



