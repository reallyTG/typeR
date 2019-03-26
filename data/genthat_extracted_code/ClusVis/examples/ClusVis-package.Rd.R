library(ClusVis)


### Name: ClusVis-package
### Title: Gaussian-Based Visualization of Gaussian and Non-Gaussian
###   Model-Based Clustering.
### Aliases: ClusVis-package ClusVis
### Keywords: package

### ** Examples

## Not run: 
##D 
##D  ## First example: R package VarSelLCM
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
##D 
##D ## Second example: R package Rmixmod
##D # Package loading
##D require(Rmixmod)
##D  
##D # Data loading (categorical data)
##D data(birds)
##D 
##D # Model-based clustering with 3 components
##D resmixmod <- mixmodCluster(birds, 3)
##D 
##D # Inference of the parameters used for results visualization (general approach)
##D # Probabilities of classification are not sampled from the model parameter,
##D # but observed probabilities of classification are used for parameter estimation
##D resvisu <- clusvis(log(resmixmod@bestResult@proba),
##D                    resmixmod@bestResult@parameters@proportions)
##D 
##D # Inference of the parameters used for results visualization
##D # (specific for Rmixmod results)
##D # It is better because probabilities of classification are generated
##D # by using the model parameters
##D resvisu <- clusvisMixmod(resmixmod)
##D 
##D # Component interpretation graph
##D plotDensityClusVisu(resvisu)
##D 
##D # Scatter-plot of the observation memberships
##D plotDensityClusVisu(resvisu,  add.obs = TRUE)
## End(Not run)



