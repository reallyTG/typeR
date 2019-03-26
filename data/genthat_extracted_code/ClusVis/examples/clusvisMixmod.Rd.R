library(ClusVis)


### Name: clusvisMixmod
### Title: This function estimates the parameters used for visualization of
###   model-based clustering performs with R package Rmixmod. To achieve
###   the parameter infernece, it automatically samples probabilities of
###   classification from the model parameters
### Aliases: clusvisMixmod

### ** Examples

## Not run: 
##D # Package loading
##D require(Rmixmod)
##D 
##D # Data loading (categorical data)
##D data(birds)
##D 
##D # Model-based clustering with 3 components
##D resmixmod <- mixmodCluster(birds, 3)
##D 
##D # Inference of the parameters used for results visualization
##D # (specific for Rmixmod results)
##D resvisu <- clusvisMixmod(resmixmod)
##D 
##D # Component interpretation graph
##D plotDensityClusVisu(resvisu)
##D 
##D # Scatter-plot of the observation memberships
##D plotDensityClusVisu(resvisu,  add.obs = TRUE)
## End(Not run)



