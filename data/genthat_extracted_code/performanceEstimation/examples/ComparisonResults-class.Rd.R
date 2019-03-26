library(performanceEstimation)


### Name: ComparisonResults-class
### Title: Class "ComparisonResults"
### Aliases: ComparisonResults ComparisonResults-class
###   plot,ComparisonResults-method show,ComparisonResults-method
###   summary,ComparisonResults-method
### Keywords: classes

### ** Examples

showClass("ComparisonResults")
## Not run: 
##D ## Estimating MAE, MSE, RMSE and MAPE for 3 variants of both
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
##D   EstimationTask(metrics=c("mae","mse","rmse","mape"),method=CV())
##D   )
##D 
##D ## Check a summary of the results
##D summary(res)
##D 
##D topPerformers(res)
##D 
##D summary(subset(res,metrics="mse"))
##D summary(subset(res,metrics="mse",partial=FALSE))
##D summary(subset(res,workflows="v1"))
## End(Not run)




