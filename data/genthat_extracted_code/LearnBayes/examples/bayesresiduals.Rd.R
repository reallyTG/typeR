library(LearnBayes)


### Name: bayesresiduals
### Title: Computation of posterior residual outlying probabilities for a
###   linear regression model
### Aliases: bayesresiduals
### Keywords: models

### ** Examples

chirps=c(20,16.0,19.8,18.4,17.1,15.5,14.7,17.1,15.4,16.2,15,17.2,16,17,14.1)
temp=c(88.6,71.6,93.3,84.3,80.6,75.2,69.7,82,69.4,83.3,78.6,82.6,80.6,83.5,76.3)
X=cbind(1,chirps)
lmfit=lm(temp~X)
m=1000
post=blinreg(temp,X,m)
k=2
bayesresiduals(lmfit,post,k)



