library(performanceEstimation)


### Name: getIterationsInfo
### Title: Obtaining the information returned by a workflow when applied to
###   a task, on a particular iteration of the estimation process or on all
###   iterations
### Aliases: getIterationsInfo
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
##D ## Get the iterations scores of svm.v2 on swiss
##D getIterationsInfo(res,"svm.v2","swiss.Infant.Mortality",rep=1,fold=2)
##D ## this would get the same
##D getIterationsInfo(res,"svm.v2","swiss.Infant.Mortality",it=2)
##D 
##D getIterationsInfo(res,"svm.v2","swiss.Infant.Mortality",rep=2,fold=3)
##D ## this would get the same
##D getIterationsInfo(res,"svm.v2","swiss.Infant.Mortality",it=8)
##D 
##D ## Get the results of all iterations
##D getIterationsInfo(res,"svm.v1","swiss.Infant.Mortality")
##D 
## End(Not run)



