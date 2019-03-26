library(performanceEstimation)


### Name: EstimationResults-class
### Title: Class "EstimationResults"
### Aliases: EstimationResults EstimationResults-class
###   plot,EstimationResults-method summary,EstimationResults-method
###   show,EstimationResults-method
### Keywords: classes

### ** Examples

showClass("EstimationResults")

## Not run: 
##D library(e1071)
##D data(swiss)
##D 
##D ## Estimating the MAE and NMSE of an SVM on the swiss task
##D eval.res <- cvEstimates(
##D                  Workflow(learner="svm",learner.pars=list(cost=10,gamma=0.1)),
##D                  PredTask(Infant.Mortality ~ .,swiss),
##D                  EstimationTask(metrics=c("mae","nmse"),method=CV(nReps=2))
##D                        )
##D 
##D ## Check a summary of the results
##D summary(eval.res)
##D 
## End(Not run)



