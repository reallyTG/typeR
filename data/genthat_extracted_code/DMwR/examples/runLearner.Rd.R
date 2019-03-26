library(DMwR)


### Name: runLearner
### Title: Run a Learning Algorithm
### Aliases: runLearner
### Keywords: models

### ** Examples

## Run multiple linear regression on the Swiss data set.
data(swiss)
lrn <- learner('lm',pars=list())
runLearner(lrn,Infant.Mortality ~ .,swiss)

## Not run: 
##D library(nnet)
##D lrn2 <- learner('nnet',pars=list(size=4,decay=0.1,linout=TRUE))
##D runLearner(lrn2,Infant.Mortality ~ .,swiss)
## End(Not run)



