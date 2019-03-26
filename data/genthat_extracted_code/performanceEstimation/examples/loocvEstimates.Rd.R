library(performanceEstimation)


### Name: loocvEstimates
### Title: Performance estimation using Leave One Out Cross Validation
### Aliases: loocvEstimates
### Keywords: models

### ** Examples

## Not run: 
##D 
##D ## Estimating the error rate of an SVM on the iris data set using
##D ## leave one out cross validation
##D library(e1071)
##D data(iris)
##D 
##D ## Now the evaluation
##D eval.res <- loocvEstimates(
##D              Workflow(wfID="svmTrial",
##D                       learner="svm",learner.pars=list(cost=10,gamma=0.1)
##D                      ),
##D              PredTask(Species ~ ., iris),
##D              EstimationTask("err",method=LOOCV()))
##D 
##D ## Check a summary of the results
##D summary(eval.res)
##D 
## End(Not run)



