library(performanceEstimation)


### Name: topPerformer
### Title: Obtain the workflow that best performed in terms of a metric on
###   a task
### Aliases: topPerformer
### Keywords: models

### ** Examples

## Not run: 
##D ## Estimating several evaluation metrics on different variants of a
##D ## regression tree and of a SVM, on  two data sets, using one repetition
##D ## of  10-fold CV
##D 
##D data(swiss)
##D data(mtcars)
##D library(e1071)
##D 
##D ## run the experimental comparison
##D results <- performanceEstimation(
##D                c(PredTask(Infant.Mortality ~ ., swiss),
##D                  PredTask(mpg ~ ., mtcars)),
##D                c(workflowVariants(learner='svm',
##D                                   learner.pars=list(cost=c(1,5),gamma=c(0.1,0.01))
##D                                  )
##D                ),
##D                EstimationTask(metrics=c("mse","mae"),method=CV(nReps=2,nFolds=5))
##D                                  )
##D 
##D ## get the top performer workflow for a metric and task
##D topPerformer(results,"mse","swiss.Infant.Mortality")
## End(Not run)



