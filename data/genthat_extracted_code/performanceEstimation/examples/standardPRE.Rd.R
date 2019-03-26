library(performanceEstimation)


### Name: standardPRE
### Title: A function for applying data pre-processing steps
### Aliases: standardPRE
### Keywords: models

### ** Examples

## Not run: 
##D 
##D ##  A small example with standard pre-preprocessing: clean NAs and scale
##D data(algae,package="DMwR")
##D 
##D idx <- sample(1:nrow(algae),150)
##D tr <- algae[idx,1:12]
##D ts <- algae[-idx,1:12]
##D summary(tr)
##D summary(ts)
##D 
##D preData <- standardPRE(a1 ~ ., tr, ts, steps=c("centralImp","scale"))
##D summary(preData$train)
##D summary(preData$test)
##D 
##D ######
##D ## Using in the context of an experiment
##D library(e1071)
##D res <- performanceEstimation(
##D   PredTask(a1 ~ .,algae[,1:12],"alga1"),
##D   Workflow(learner="svm",pre=c("centralImp","scale")),
##D   EstimationTask(metrics="mse")
##D   )
##D 
##D summary(res)
##D 
##D ######
##D ## A user-defined pre-processing function
##D myScale <- function(f,tr,ts,avg,std,...) {
##D     tgtVar <- deparse(f[[2]])
##D     allPreds <- setdiff(colnames(tr),tgtVar)
##D     numPreds <- allPreds[sapply(allPreds,
##D                           function(p) is.numeric(tr[[p]]))]
##D     tr[,numPreds] <- scale(tr[,numPreds],center=avg,scale=std)
##D     ts[,numPreds] <- scale(ts[,numPreds],center=avg,scale=std)
##D     list(train=tr,test=ts)
##D }
##D 
##D ## now using it with some random averages and stds for the 8 numeric
##D ## predictors (just for illustration)
##D newData <- standardPRE(a1 ~ .,tr,ts,steps="myScale",
##D                        avg=rnorm(8),std=rnorm(8))
##D 
## End(Not run)




