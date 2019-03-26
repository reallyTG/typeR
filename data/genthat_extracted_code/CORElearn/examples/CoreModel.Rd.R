library(CORElearn)


### Name: CoreModel
### Title: Build a classification or regression model
### Aliases: CoreModel cvCoreModel
### Keywords: models regression nonlinear tree multivariate loess classif

### ** Examples

# use iris data set
trainIdxs <- sample(x=nrow(iris), size=0.7*nrow(iris), replace=FALSE)
testIdxs <- c(1:nrow(iris))[-trainIdxs]

# build random forests model with certain parameters
# setting maxThreads to 0 or more than 1 forces 
# utilization of several processor cores 
modelRF <- CoreModel(Species ~ ., iris[trainIdxs,], model="rf",
              selectionEstimator="MDL",minNodeWeightRF=5,
              rfNoTrees=100, maxThreads=1)
print(modelRF) # simple visualization, test also others with function plot
# prediction on testing set
pred <- predict(modelRF, iris[testIdxs,], type="both") 
mEval <- modelEval(modelRF, iris[["Species"]][testIdxs], pred$class, pred$prob)
print(mEval) # evaluation of the model
# visualization of individual predictions and the model
## Not run: 
##D require(ExplainPrediction)
##D explainVis(modelRF, iris[trainIdxs,], iris[testIdxs,], method="EXPLAIN",
##D            visLevel="model", problemName="iris", fileType="none", 
##D            classValue=1, displayColor="color") 
##D # turn on the history in visualization window to see all instances
##D explainVis(modelRF, iris[trainIdxs,], iris[testIdxs,], method="EXPLAIN",
##D            visLevel="instance", problemName="iris", fileType="none", 
##D            classValue=1, displayColor="color") 
## End(Not run)
destroyModels(modelRF) # clean up


# build decision tree with naive Bayes in the leaves
# more appropriate for large data sets one can specify just the target variable
modelDT <- CoreModel("Species", iris, model="tree", modelType=4)
print(modelDT)
destroyModels(modelDT) # clean up


# build regression tree similar to CART
instReg <- regDataGen(200)
modelRT <- CoreModel(response~., instReg, model="regTree", modelTypeReg=1)
print(modelRT)
destroyModels(modelRT) # clean up

# build kNN kernel regressor by preventing tree splitting
modelKernel <- CoreModel(response~., instReg, model="regTree",
                    modelTypeReg=7, minNodeWeightTree=Inf)
print(modelKernel)
destroyModels(modelKernel) # clean up

## Not run: 
##D # A more complex example 
##D # Test accuracy of random forest predictor with 20 trees on iris data
##D # using 10-fold cross-validation.
##D ncases <- nrow(iris)
##D ind <- ceiling(10*(1:ncases)/ncases)
##D ind <- sample(ind,length(ind))
##D pred <- rep(NA,ncases)
##D fit <- NULL
##D for (i in unique(ind)) {
##D     # Delete the previous model, if there is one.
##D     fit <- CoreModel(Species ~ ., iris[ind!=i,], model="rf", 
##D                      rfNoTrees=20, maxThreads=1)
##D     pred[ind==i] <- predict(fit, iris[ind==i,], type="class")
##D     if (!is.null(fit)) destroyModels(fit) # dispose model no longer needed
##D  
##D }
##D table(pred,iris$Species)
## End(Not run)
# a simpler way to estimate performance using cross-validation
model <- cvCoreModel(Species ~ ., iris, model="rf", rfNoTrees=20, 
                    folds=10, stratified=TRUE, returnModel=TRUE,
                    maxThreads=1)    
model$avgs           




