library(CORElearn)


### Name: rfAttrEval
### Title: Attribute evaluation with random forest
### Aliases: rfAttrEval rfAttrEvalClustering
### Keywords: models nonlinear tree classif

### ** Examples

# build random forests model with certain parameters
modelRF <- CoreModel(Species ~ ., iris, model="rf", 
              selectionEstimator="MDL", minNodeWeightRF=5, 
              rfNoTrees=100, maxThreads=1)
rfAttrEval(modelRF) # feature evaluations

x <- rfAttrEval(modelRF) # feature evaluations for each class
print(x)

destroyModels(modelRF) # clean up





