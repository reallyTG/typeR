library(performanceEstimation)


### Name: results2table
### Title: Obtains a dplyr data frame table object containing all the
###   results of an experiment
### Aliases: results2table
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
##D   PredTask(Infant.Mortality ~ .,swiss,"Swiss"),
##D   workflowVariants(learner="svm",
##D                    learner.pars=list(cost=c(1,10),gamma=c(0.01,0.5))),
##D   EstimationTask(metrics=c("mse","nmae"),method=CV(nReps=2,nFolds=5))
##D   )
##D 
##D ## Obtaining a table with the results
##D library(dplyr)
##D tbl <- results2table(res)
##D 
##D ## Mean and standard deviation of each workflow per task (only one in
##D ## this example) and metric
##D group_by(tbl,Task,Workflow,Metric) ##D 
##D      summarize_each_(funs(mean,sd),"Score")
##D 
##D ## Top 2 workflows in terms of MSE for this task
##D filter(tbl,Task=="Swiss",Metric=="mse") ##D 
##D     group_by(Workflow) ##D 
##D       summarize_each_(funs(mean),"Score") ##D 
##D         arrange(Score) ##D 
##D           slice(1:2)
## End(Not run)



