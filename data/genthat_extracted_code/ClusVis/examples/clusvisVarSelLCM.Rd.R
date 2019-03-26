library(ClusVis)


### Name: clusvisVarSelLCM
### Title: This function estimates the parameters used for visualization of
###   model-based clustering performs with R package Rmixmod. To achieve
###   the parameter infernece, it automatically samples probabilities of
###   classification from the model parameters
### Aliases: clusvisVarSelLCM

### ** Examples

## Not run: 
##D 
##D  # Package loading
##D  require(VarSelLCM)
##D 
##D  # Data loading (categorical data)
##D  data("congress")
##D  # Model-based clustering with 3 components
##D  res <- VarSelCluster(congress, 3)
##D 
##D  # Inference of the parameters used for results visualization
##D  # (specific for Rmixmod results)
##D  # It is better because probabilities of classification are generated
##D  # by using the model parameters
##D  resvisu <- clusvisVarSelLCM(res)
##D 
##D  # Component interpretation graph
##D  plotDensityClusVisu(resvisu)
##D 
##D  # Scatter-plot of the observation memberships
##D  plotDensityClusVisu(resvisu,  add.obs = TRUE)
##D 
## End(Not run)



