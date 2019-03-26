library(performanceEstimation)


### Name: standardWF
### Title: A function implementing a standard workflow for prediction tasks
### Aliases: standardWF
### Keywords: models

### ** Examples

## Not run: 
##D data(iris)
##D library(e1071)
##D 
##D ## a standard workflow using and SVM with default parameters
##D w.s <- Workflow(wfID="std.svm",learner="svm")
##D w.s
##D 
##D irisExp <- performanceEstimation(
##D   PredTask(Species ~ .,iris),
##D   w.s,
##D   EstimationTask("acc"))
##D 
##D getIterationsPreds(irisExp,1,1,it=4)
##D getIterationsInfo(irisExp,1,1,rep=1,fold=2)
##D 
##D ## A more sophisticated standardWF
##D ## - as pre-processing we imput NAs with either the median (numeric
##D ## features) or the mode (nominal features); and we also scale
##D ## (normalize) the numeric predictors
##D ## - as learning algorithm we use and SVM with cost=10 and gamma=0.01
##D ## - as post-processing we scale all predictions into the range [0..50]
##D w.s2 <- Workflow(pre=c("centralImp","scale"), 
##D                  learner="svm",
##D                  learner.pars=list(cost=10,gamma=0.01),
##D                  post="cast2int",
##D                  post.pars=list(infLim=0,supLim=50),
##D                  .fullOutput=TRUE
##D                 )
##D 
##D data(algae,package="DMwR")
##D 
##D a1.res <- performanceEstimation(
##D             PredTask(a1 ~ ., algae[,1:12],"alga1"),
##D             w.s2,
##D             EstimationTask("mse")
##D             )
##D 
##D ## Workflow variants of a standard workflow
##D ws <- workflowVariants(
##D                  pre=c("centralImp","scale"), 
##D                  learner="svm",
##D                  learner.pars=list(cost=c(1,5,10),gamma=0.01),
##D                  post="cast2int",
##D                  post.pars=list(infLim=0,supLim=c(10,50,80)),
##D                  .fullOutput=TRUE,
##D                  as.is="pre"
##D                 )
##D a1.res <- performanceEstimation(
##D             PredTask(a1 ~ ., algae[,1:12],"alga1"),
##D             ws,
##D             EstimationTask("mse")
##D             )
##D 
##D ## An example using GBM that is a bit different in terms of the
##D ## prediction part as it requires to select the number of trees of the
##D ## ensemble to use
##D data(Boston, package="MASS")
##D library(gbm)
##D 
##D ## A user written predict function to allow for using the standard
##D ## workflows
##D gbm.predict <- function(model, test, method, ...) {
##D     best <- gbm.perf(model, plot.it=FALSE, method=method)
##D     return(predict(model, test, n.trees=best, ...))
##D }
##D 
##D resG <- performanceEstimation(
##D              PredTask(medv ~.,Boston),
##D              Workflow(learner="gbm",
##D                       learner.pars=list(n.trees=1000, cv.folds=10),
##D                       predictor="gbm.predict",
##D                       predictor.pars=list(method="cv")),
##D              EstimationTask(metrics="mse",method=CV())
##D         )
##D 
## End(Not run)



