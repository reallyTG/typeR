library(performanceEstimation)


### Name: metricsSummary
### Title: Obtains a summary of the individual metric scores obtained by
###   each workflow on a set of tasks.
### Aliases: metricsSummary
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
##D ## Get the minium value of each metric on all iterations of the CV
##D ## process. 
##D metricsSummary(results,summary="min")
##D 
##D ## Get a summary table for each task with the estimated scores for each
##D ## metric by each workflow
##D metricsSummary(results)
## End(Not run)



