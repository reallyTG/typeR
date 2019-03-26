library(CORElearn)


### Name: rfOOB
### Title: Out-of-bag performance estimation for random forests
### Aliases: rfOOB
### Keywords: models nonlinear tree classif

### ** Examples

# build random forests model with certain parameters
modelRF <- CoreModel(Species ~ ., iris, model="rf", 
              selectionEstimator="MDL", minNodeWeightRF=5, 
              rfNoTrees=100, maxThreads=1)
rfOOB(modelRF) 

destroyModels(modelRF) # clean up




