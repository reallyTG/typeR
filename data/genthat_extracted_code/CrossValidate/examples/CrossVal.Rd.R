library(CrossValidate)


### Name: CrossValidate
### Title: Creating CrossValidate objects
### Aliases: CrossValidate
### Keywords: classif models

### ** Examples

dataset <- matrix(rnorm(50*100), nrow=50)
pseudoclass <- factor(rep(c("A", "B"), each=50))
model <- modelerCCP # obviously, other models can be used
numTimes <- 10 # and more is probably better
cv <- CrossValidate(model, dataset, pseudoclass, 0.5, numTimes)
summary(cv)



