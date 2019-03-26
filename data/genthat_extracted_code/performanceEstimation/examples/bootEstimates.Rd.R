library(performanceEstimation)


### Name: bootEstimates
### Title: Performance estimation using (e0 or .632) bootstrap
### Aliases: bootEstimates
### Keywords: models

### ** Examples

## Not run: 
##D 
##D ## Estimating the MSE of a SVM variant on the 
##D ##  swiss data, using 50 repetitions of .632 bootstrap
##D library(e1071)
##D data(swiss)
##D 
##D ## running the estimation experiment
##D res <- bootEstimates(
##D   Workflow(wfID="svmC10G01",
##D            learner="svm",learner.pars=list(cost=10,gamma=0.1)
##D           ),
##D   PredTask(Infant.Mortality ~ .,swiss),
##D   EstimationTask("mse",method=Bootstrap(type=".632",nReps=50))
##D   )
##D 
##D ## Check a summary of the results
##D summary(res)
##D 
## End(Not run)



