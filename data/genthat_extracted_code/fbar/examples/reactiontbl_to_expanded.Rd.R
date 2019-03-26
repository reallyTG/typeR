library(fbar)


### Name: reactiontbl_to_expanded
### Title: Parse a reaction table to an intermediate, long format
### Aliases: reactiontbl_to_expanded

### ** Examples


## Not run: 
##D data(ecoli_core)
##D library(dplyr)
##D try(library(ROI.plugin.ecos)) # make a solver available to ROI
##D 
##D roi_model <- ecoli_core %>%
##D   reactiontbl_to_expanded %>%
##D   expanded_to_ROI
##D   
##D if(length(ROI::ROI_applicable_solvers(roi_model))>=1){
##D   roi_result <- ROI::ROI_solve(roi_model)
##D   
##D   ecoli_core_with_flux <- ecoli_core %>%
##D     mutate(flux = roi_result[['solution']])
##D }
## End(Not run)



