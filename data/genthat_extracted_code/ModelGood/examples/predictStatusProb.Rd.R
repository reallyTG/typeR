library(ModelGood)


### Name: predictStatusProb
### Title: Probability Predictions
### Aliases: predictStatusProb predictStatusProb.default
###   predictStatusProb.glm predictStatusProb.lrm predictStatusProb.numeric
###   predictStatusProb.randomForest predictStatusProb.rfsrc
###   predictStatusProb.rpart
### Keywords: models

### ** Examples

library(rms)
set.seed(7)
x <- abs(rnorm(20))
d <- data.frame(y=rbinom(20,1,x/max(x)),x=x,z=rnorm(20))
nd <- data.frame(y=rbinom(8,1,x/max(x)),x=abs(rnorm(8)),z=rnorm(8))
fit <- lrm(y~x+z,d)
predictStatusProb(fit,newdata=nd)



