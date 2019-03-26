library(performanceEstimation)


### Name: CV-class
### Title: Class "CV"
### Aliases: CV CV-class show,CV-method
### Keywords: classes

### ** Examples

showClass("CV")

## the defaults (1 x 10-fold CV)
s <- CV()

## stratified 2 x 5-fold CV
s1 <- CV(nReps=2,nFolds=5,strat=TRUE)

## Small example illustrating the format of user supplied data splits.
## This could be a 3-fold CV process of a data set with 30 cases
s2 <- CV(dataSplits=list(1:10,11:20,21:30))
s2




