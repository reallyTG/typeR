library(performanceEstimation)


### Name: topPerformers
### Title: Obtain the best scores from a performance estimation experiment
### Aliases: topPerformers
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
##D ## get the top performers for each task and evaluation metric
##D topPerformers(results)
## End(Not run)



