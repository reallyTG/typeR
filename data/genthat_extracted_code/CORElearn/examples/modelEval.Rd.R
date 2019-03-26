library(CORElearn)


### Name: modelEval
### Title: Statistical evaluation of predictions
### Aliases: modelEval
### Keywords: models regression nonlinear tree multivariate loess classif

### ** Examples

# use iris data

# build random forests model with certain parameters
model <- CoreModel(Species ~ ., iris, model="rf", 
              selectionEstimator="MDL",minNodeWeightRF=5,
              rfNoTrees=100, maxThreads=1)

# prediction with node distribution
pred <- predict(model, iris, rfPredictClass=FALSE)

# Model evaluation
mEval <- modelEval(model, iris[["Species"]], pred$class, pred$prob)
print(mEval)

# use nonuniform cost matrix
noClasses <- length(levels(iris[["Species"]]))
costMatrix <- 1 - diag(noClasses)
costMatrix[3,1] <- costMatrix[3,2] <- 5 # assume class 3 is more valuable  
mEvalCost <- modelEval(model, iris[["Species"]], pred$class, pred$prob, 
                       costMatrix=costMatrix)
print(mEvalCost)

destroyModels(model) # clean up




