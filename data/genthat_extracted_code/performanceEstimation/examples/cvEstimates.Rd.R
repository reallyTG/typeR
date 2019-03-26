library(performanceEstimation)


### Name: cvEstimates
### Title: Performance estimation using cross validation
### Aliases: cvEstimates
### Keywords: models

### ** Examples

## Not run: 
##D 
##D ## Estimating the mean squared error  of svm on the swiss data,
##D ## using two repetitions of 10-fold CV
##D library(e1071)
##D data(swiss)
##D 
##D ## Now the evaluation
##D eval.res <- cvEstimates(
##D              Workflow(wf="standardWF", wfID="mySVMtrial",
##D                       learner="svm", learner.pars=list(cost=10,gamma=0.1)
##D                      ),
##D              PredTask(Infant.Mortality ~ ., swiss),
##D              EstimationTask(metrics="mse",method=CV(nReps=2,nFolds=10))
##D                        )
##D 
##D ## Check a summary of the results
##D summary(eval.res)
##D 
##D 
##D ## An example with a user-defined workflow function implementing a
##D ## simple approach using linear regression models but also containing
##D ## some data-preprocessing and well as results post-processing.
##D myLM <- function(form,train,test,k=10,.outModel=FALSE) {
##D     require(DMwR)
##D     ## fill-in NAs on both the train and test sets
##D     ntr <- knnImputation(train,k)
##D     nts <- knnImputation(test,k,distData=train)
##D     ## obtain a linear regression model and simplify it
##D     md <- lm(form,ntr)
##D     md <- step(md)
##D     ## get the model predictions
##D     p <- predict(md,nts)
##D     ## post-process the predictions (this is an example assuming the target
##D     ## variable is always positive so we change negative predictions into 0)
##D     p <- ifelse(p < 0,0,p)
##D     ## now get the final return object
##D     res <- list(trues=responseValues(form,nts), preds=p)
##D     if (.outModel) res <- c(res,list(model=m))
##D     res
##D }
##D 
##D ## Now for the CV estimation 
##D data(algae,package="DMwR")
##D eval.res2 <- cvEstimates(
##D              Workflow(wf="myLM",k=5),
##D              PredTask(a1 ~ ., algae[,1:12],"alga1"),
##D              EstimationTask("mse",method=CV()))
##D 
##D ## Check a summary of the results
##D summary(eval.res2)
##D 
##D ##
##D ## Parallel execution example
##D ##
##D ## Comparing the time of sequential and parallel execution
##D ## using half of the cores of the local machine
##D ##
##D data(Satellite,package="mlbench")
##D library(e1071)
##D system.time({p <- cvEstimates(Workflow(learner="svm"),
##D                               PredTask(classes ~ .,Satellite),
##D                               EstimationTask("err",Boot(nReps=10)),
##D                               cluster=TRUE)})[3]
##D system.time({np <- cvEstimates(Workflow(learner="svm"),
##D                                PredTask(classes ~ .,Satellite),
##D                                EstimationTask("err",Boot(nReps=10)))})[3]
##D 
## End(Not run)



