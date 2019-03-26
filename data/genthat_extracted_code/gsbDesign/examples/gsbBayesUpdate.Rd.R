library(gsbDesign)


### Name: gsbBayesUpdate
### Title: Bayesian Update
### Aliases: gsbBayesUpdate
### Keywords: bayes update

### ** Examples

## One dimensional case, with.alpha = FALSE
gsbBayesUpdate(beta=10,precisionData=20, with.alpha=FALSE)

## Two dimensional case, with.alpha = TRUE
gsbBayesUpdate(alpha=c(5,6),beta=c(10,11),meanData=c(10,11),
               precisionData=c(20,21),with.alpha=TRUE)



