library(fbar)


### Name: expanded_to_ROI
### Title: Parse a long format metabolic model to an ROI model
### Aliases: expanded_to_ROI

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



