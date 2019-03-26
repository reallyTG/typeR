library(performanceEstimation)


### Name: mergeEstimationRes
### Title: Merging several 'ComparisonResults' class objects
### Aliases: mergeEstimationRes
### Keywords: models

### ** Examples

## Not run: 
##D ## Run some experiments with the swiss data and two different
##D ## prediction models
##D data(swiss)
##D 
##D exp1 <- performanceEstimation(
##D   PredTask(Infant.Mortality ~ .,swiss),
##D   workflowVariants(learner="svm",
##D                    learner.pars=list(cost=c(1,10),gamma=c(0.01,0.5))),
##D   EstimationTask("mse")
##D   )
##D 
##D exp2 <- performanceEstimation(
##D   PredTask(Infant.Mortality ~ .,swiss),
##D   Workflow(learner="lm"),
##D   EstimationTask("mse")
##D   )
##D 
##D 
##D ## joining the two experiments by workflows
##D all <- mergeEstimationRes(exp1,exp2,by="workflows")
##D topPerformers(all) # check the best results
##D 
##D ## now an example by adding new metrics
##D exp3 <- performanceEstimation(
##D   PredTask(Infant.Mortality ~ .,swiss),
##D   Workflow(learner="lm"),
##D   EstimationTask(metrics=c("mae","totTime"))
##D   )
##D 
##D allLM <- mergeEstimationRes(exp2,exp3,by="metrics")
##D topPerformers(allLM) 
##D 
## End(Not run)



