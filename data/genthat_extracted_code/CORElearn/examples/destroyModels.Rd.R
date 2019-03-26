library(CORElearn)


### Name: destroyModels
### Title: Destroy single model or all CORElearn models
### Aliases: destroyModels
### Keywords: models regression tree classif

### ** Examples

# use iris data set

# build random forests model with certain parameters
model <- CoreModel(Species ~ ., iris, model="rf", 
              selectionEstimator="MDL", minNodeWeightRF=5,
              rfNoTrees=100, maxThreads=1)

# prediction 
pred <- predict(model, iris, rfPredictClass=FALSE)
# print(pred)

# destruction of model's internal representation
destroyModels(model)




