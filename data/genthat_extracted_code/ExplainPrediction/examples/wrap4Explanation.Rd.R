library(ExplainPrediction)


### Name: wrap4Explanation
### Title: Wrap prediction model for explanations
### Aliases: wrap4Explanation
### Keywords: models regression classif

### ** Examples

## Not run: 
##D # use iris data set, split it randomly into a training and testing set
##D trainIdxs <- sample(x=nrow(iris), size=0.7*nrow(iris), replace=FALSE)
##D testIdxs <- c(1:nrow(iris))[-trainIdxs]
##D # build a nnet model with certain parameters
##D require(nnet)
##D modelNN <- nnet(Species ~ ., iris[trainIdxs,], size=20)
##D 
##D # use wrapper
##D modelNNet <- wrap4Explanation(modelNN)
##D 
##D # generate model explanation and visualization
##D # turn on history in the visualization window to see all graphs
##D explainVis(modelNNet, iris[trainIdxs,], iris[testIdxs,], method="EXPLAIN",visLevel="both",
##D            problemName="iris", fileType="none", 
##D            naMode="avg", explainType="WE", classValue=1) 
## End(Not run)



