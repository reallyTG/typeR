library(LearnBayes)


### Name: bayes.probit
### Title: Simulates from a probit binary response regression model using
###   data augmentation and Gibbs sampling
### Aliases: bayes.probit
### Keywords: models

### ** Examples

response=c(0,1,0,0,0,1,1,1,1,1)
covariate=c(1,2,3,4,5,6,7,8,9,10)
X=cbind(1,covariate)
prior=list(beta=c(0,0),P=diag(c(.5,10)))
m=1000
s=bayes.probit(response,X,m,prior)



