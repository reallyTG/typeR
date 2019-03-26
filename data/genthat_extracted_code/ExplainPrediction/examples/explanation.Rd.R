library(ExplainPrediction)


### Name: explanation
### Title: Explanation of predictions on instance and model level
### Aliases: explain prepareForExplanations explanationAverages explainVis
### Keywords: models regression classif

### ** Examples

require(CORElearn)
# use iris data set, split it randomly into a training and testing set
trainIdxs <- sample(x=nrow(iris), size=0.7*nrow(iris), replace=FALSE)
testIdxs <- c(1:nrow(iris))[-trainIdxs]
# build random forests model with certain parameters
modelRF <- CoreModel(Species ~ ., iris[trainIdxs,], model="rf",
              selectionEstimator="MDL",minNodeWeightRF=5,
              rfNoTrees=100, maxThreads=1)

# generate model explanation and visualization
# turn on history in the visualization window to see all graphs
explainVis(modelRF, iris[trainIdxs,], iris[testIdxs,], method="EXPLAIN",visLevel="both",
           fileType="none", naMode="avg", explainType="WE", classValue=1) 
## Not run: 
##D #store instance explanations in grayscale to file in PDF format
##D explainVis(modelRF, iris[trainIdxs,], iris[testIdxs,], method="EXPLAIN", visLevel="instance",
##D            fileType="pdf", naMode="avg", explainType="WE", classValue=1, colors=NULL) 
##D destroyModels(modelRF) # clean up
##D 
##D # build a regression tree 
##D trainReg <- regDataGen(100)
##D testReg <- regDataGen(20)
##D modelRT <- CoreModel(response~., trainReg, model="regTree", modelTypeReg=1)
##D # generate both model and instance level explanation using defaults
##D explainVis(modelRT, trainReg, testReg) 
##D destroyModels(modelRT) #clean up
## End(Not run)



