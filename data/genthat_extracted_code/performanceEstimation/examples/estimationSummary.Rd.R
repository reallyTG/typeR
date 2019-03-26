library(performanceEstimation)


### Name: estimationSummary
### Title: Obtain a set of descriptive statistics of the scores of a
###   workflow on a task
### Aliases: estimationSummary
### Keywords: models

### ** Examples

## Not run: 
##D ## Estimating MSE for 3 variants of both
##D ## regression trees and SVMs, on  two data sets, using one repetition
##D ## of 10-fold CV
##D library(e1071)
##D data(swiss)
##D 
##D ## running the estimation experiment
##D res <- performanceEstimation(
##D   PredTask(Infant.Mortality ~ .,swiss),
##D   workflowVariants(learner="svm",
##D                    learner.pars=list(cost=c(1,10),gamma=c(0.01,0.5))),
##D   EstimationTask("mse",method=CV(nReps=2,nFolds=5))
##D   )
##D 
##D ## Get the summary of the estimations of svm.v2 on swiss
##D estimationSummary(res,"svm.v2","swiss.Infant.Mortality")
##D 
## End(Not run)



