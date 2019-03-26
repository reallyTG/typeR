library(CORElearn)


### Name: getRFsizes
### Title: Get sizes of the trees in RF
### Aliases: getRFsizes
### Keywords: models regression tree multivariate classif

### ** Examples

# uses iris data set

# build random forests model with certain parameters, 
# do not make too many and too large trees
modelRF <- CoreModel(Species ~ ., iris, model="rf", 
              selectionEstimator="MDL", minNodeWeightRF=50, 
              rfNoTrees=50, maxThreads=1)

getRFsizes(modelRF) 

destroyModels(modelRF) # clean up



