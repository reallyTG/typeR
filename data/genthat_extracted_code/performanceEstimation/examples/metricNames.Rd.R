library(performanceEstimation)


### Name: metricNames
### Title: The evaluation metrics estimated in an experiment
### Aliases: metricNames
### Keywords: models

### ** Examples

## Not run: 
##D ## Estimating MSE for 3 variants of both
##D ## regression trees and SVMs, on  two data sets, using one repetition
##D ## of 10-fold CV
##D library(e1071)
##D library(DMwR)
##D data(swiss)
##D data(mtcars)
##D 
##D ## running the estimation experiment
##D res <- performanceEstimation(
##D   c(PredTask(Infant.Mortality ~ .,swiss),PredTask(mpg ~ ., mtcars)),
##D   c(workflowVariants(learner="svm",
##D                      learner.pars=list(cost=c(1,10),gamma=c(0.01,0.5))),
##D     workflowVariants(learner="rpartXse",
##D                      learner.pars=list(se=c(0,0.5,1)))
##D   ),
##D   EstimationTask("mse")
##D   )
##D 
##D ## the names of the metrics that were estimated in the above experiment
##D metricNames(res)
## End(Not run)



