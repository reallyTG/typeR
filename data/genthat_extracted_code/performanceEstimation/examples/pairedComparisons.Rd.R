library(performanceEstimation)


### Name: pairedComparisons
### Title: Statistical hypothesis testing on the observed paired
###   differences in estimated performance.
### Aliases: pairedComparisons
### Keywords: models

### ** Examples

## Not run: 
##D ## Estimating MSE for 3 variants of both
##D ## regression trees and SVMs, on  two data sets, using one repetition
##D ## of 10-fold CV
##D library(e1071)
##D data(iris)
##D data(Satellite,package="mlbench")
##D data(LetterRecognition,package="mlbench")
##D 
##D 
##D ## running the estimation experiment
##D res <- performanceEstimation(
##D            c(PredTask(Species ~ .,iris),
##D              PredTask(classes ~ .,Satellite,"sat"),
##D              PredTask(lettr ~ .,LetterRecognition,"letter")),
##D            workflowVariants(learner="svm",
##D                  learner.pars=list(cost=1:4,gamma=c(0.1,0.01))),
##D            EstimationTask(metrics=c("err","acc"),method=CV()))
##D 
##D 
##D ## checking the top performers
##D topPerformers(res)
##D 
##D ## now let us assume that we will choose "svm.v2" as our baseline
##D ## carry out the paired comparisons
##D pres <- pairedComparisons(res,"svm.v2")
##D 
##D ## obtaining a CD diagram comparing all others against svm.v2 in terms
##D ## of error rate
##D CDdiagram.BD(pres,metric="err")
##D 
## End(Not run)



