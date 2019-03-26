library(performanceEstimation)


### Name: hldEstimates
### Title: Performance estimation using holdout and random resampling
### Aliases: hldEstimates
### Keywords: models

### ** Examples

## Not run: 
##D 
##D ## Estimating the mean absolute error and the normalized mean squared
##D ## error of rpart on the swiss data, using 70%-30% hold-out
##D library(e1071)
##D data(swiss)
##D 
##D ## Now the evaluation
##D eval.res <- hldEstimates(
##D              Workflow(wf="standardWF",wfID="svmApproach",
##D                       learner="svm",learner.pars=list(cost=10,gamma=0.1)
##D                      ),
##D              PredTask(Infant.Mortality ~ ., swiss),
##D              EstimationTask(metrics=c("mae","nmse"),
##D                             method=Holdout(nReps=5,hldSz=0.3))
##D                         )
##D 
##D ## Check a summary of the results
##D summary(eval.res)
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
##D ## Now for the Holdout estimation 
##D data(algae,package="DMwR")
##D eval.res2 <- hldEstimates(
##D              Workflow(wf="myLM",k=5),
##D              PredTask(a1 ~ ., algae[,1:12],"alga1"),
##D              EstimationTask("mse",method=Holdout(nReps=5)))
##D 
##D ## Check a summary of the results
##D summary(eval.res2)
## End(Not run)



