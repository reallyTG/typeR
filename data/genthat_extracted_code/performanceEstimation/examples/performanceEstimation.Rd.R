library(performanceEstimation)


### Name: performanceEstimation
### Title: Estimate the predictive performance of modeling alternatives on
###   different predictive tasks
### Aliases: performanceEstimation
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
##D ## Estimating MSE using 10-fold CV for 4 variants of a standard workflow
##D ## using an SVM as base learner and 3 variants of a regression tree. 
##D res <- performanceEstimation(
##D   c(PredTask(Infant.Mortality ~ .,swiss),PredTask(mpg ~ ., mtcars)),
##D   c(workflowVariants(learner="svm",
##D                      learner.pars=list(cost=c(1,10),gamma=c(0.01,0.5))),
##D     workflowVariants(learner="rpartXse",
##D                      learner.pars=list(se=c(0,0.5,1)))
##D   ),
##D   EstimationTask(metrics="mse")
##D   )
##D 
##D ## Check a summary of the results
##D summary(res)
##D 
##D ## best performers for each metric and task
##D topPerformers(res)
##D 
##D 
##D ## Estimating the accuracy of a default SVM on IRIS using 10 repetitions
##D ## of a 80%-20% Holdout
##D data(iris)
##D res1 <- performanceEstimation(PredTask(Species  ~ .,iris),
##D              Workflow(learner="svm"),
##D              EstimationTask(metrics="acc",method=Holdout(nReps=10,hldSz=0.2)))
##D summary(res1)
##D 
##D ## Now an example with a user-defined workflow
##D myWF <- function(form,train,test,wL=0.5,...) {
##D     require(rpart,quietly=TRUE)
##D     ml <- lm(form,train)
##D     mr <- rpart(form,train)
##D     pl <- predict(ml,test)
##D     pr <- predict(mr,test)
##D     ps <- wL*pl+(1-wL)*pr
##D     list(trues=responseValues(form,test),preds=ps)
##D }
##D resmywf <- performanceEstimation(
##D              PredTask(mpg ~ ., mtcars),
##D              workflowVariants(wf="myWF",wL=seq(0,1,by=0.1)),
##D              EstimationTask(metrics="mae",method=Bootstrap(nReps=50))
##D            )
##D summary(resmywf)
##D 
## End(Not run)




