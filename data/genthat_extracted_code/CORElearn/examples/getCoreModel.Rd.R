library(CORElearn)


### Name: getCoreModel
### Title: Conversion of model to a list
### Aliases: getCoreModel
### Keywords: models regression tree multivariate classif

### ** Examples

# uses iris data set

# build random forests model with certain parameters, 
# do not make too many and too large trees
modelRF <- CoreModel(Species ~ ., iris, model="rf", 
              selectionEstimator="MDL", minNodeWeightRF=50,
              rfNoTrees=5, maxThreads=1)
print(modelRF)

# get the structure of the forest 
forest <- getCoreModel(modelRF) 
# forest

destroyModels(modelRF) # clean up
 



