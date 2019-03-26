library(CORElearn)


### Name: predict.CoreModel
### Title: Prediction using constructed model
### Aliases: predict.CoreModel predict
### Keywords: models regression nonlinear tree multivariate loess classif

### ** Examples

# use iris data set

# build random forests model with certain parameters
modelRF <- CoreModel(Species ~ ., iris, model="rf", 
              selectionEstimator="MDL",minNodeWeightRF=5,rfNoTrees=100)
print(modelRF)

# prediction with node distribution
pred <- predict(modelRF, iris, rfPredictClass=FALSE, type="both")
# print(pred)

destroyModels(modelRF) # clean up




