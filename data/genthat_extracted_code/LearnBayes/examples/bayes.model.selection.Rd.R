library(LearnBayes)


### Name: bayes.model.selection
### Title: Bayesian regression model selection using G priors
### Aliases: bayes.model.selection
### Keywords: models

### ** Examples

data(birdextinct)
logtime=log(birdextinct$time)
X=cbind(1,birdextinct$nesting,birdextinct$size,birdextinct$status)
bayes.model.selection(logtime,X,100)



