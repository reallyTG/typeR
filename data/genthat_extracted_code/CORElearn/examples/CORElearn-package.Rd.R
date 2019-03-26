library(CORElearn)


### Name: CORElearn-package
### Title: R port of CORElearn
### Aliases: CORElearn-package CORElearn
### Keywords: package datasets models regression nonlinear tree
###   multivariate loess classif

### ** Examples

# load the package
library(CORElearn) 
cat(versionCore(),"\n")

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

# compute statistics
mEval <- modelEval(modelRF, iris[["Species"]][testIdxs], pred$class, pred$prob)
print(mEval) 

## Not run: 
##D # explain predictions on the level of model and individual instances
##D require(ExplainPrediction)
##D explainVis(modelRF, iris[trainIdxs,], iris[testIdxs,], method="EXPLAIN",
##D            visLevel="model", problemName="iris", fileType="none", 
##D            classValue=1, displayColor="color") 
##D # turn on the history in visualization window to see all instances
##D explainVis(modelRF, iris[trainIdxs,], iris[testIdxs,], method="EXPLAIN",
##D            visLevel="instance", problemName="iris", fileType="none", 
##D            classValue=1, displayColor="color") 
## End(Not run)
# Clean up, otherwise the memory is still taken
destroyModels(modelRF) # clean up

 
# evaluate features in given data set with selected method
# instead of formula interface one can provide just 
# the name or index of target variable
estReliefF <- attrEval("Species", iris, 
                       estimator="ReliefFexpRank", ReliefIterations=30)
print(estReliefF)
    
# evaluate ordered features with ordEval
profiles <- ordDataGen(200)
est <- ordEval(class ~ ., profiles, ordEvalNoRandomNormalizers=100)
# print(est)  




