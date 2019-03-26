library(SamplingStrata)


### Name: selectSample
### Title: Selection of a stratified sample from the frame with srswor
###   method
### Aliases: selectSample
### Keywords: survey

### ** Examples

## Not run: 
##D library(SamplingStrata)
##D data(swisserrors)
##D data(swissstrata)
##D # optimisation of sampling strata
##D solution <- optimizeStrata ( 
##D     errors = swisserrors, 
##D     strata = swissstrata 
##D )
##D # updating sampling strata with new strata labels
##D newstrata <- updateStrata(swissstrata, solution)
##D # updating sampling frame with new strata labels
##D data(swissframe)
##D framenew <- updateFrame(frame=swissframe,newstrata=newstrata)
##D # selection of sample
##D sample <- selectSample(frame=framenew,outstrata=solution$aggr_strata)
##D head(sample)
## End(Not run)



