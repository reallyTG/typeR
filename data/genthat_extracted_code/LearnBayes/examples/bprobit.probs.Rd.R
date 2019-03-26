library(LearnBayes)


### Name: bprobit.probs
### Title: Simulates fitted probabilities for a probit regression model
### Aliases: bprobit.probs
### Keywords: models

### ** Examples

response=c(0,1,0,0,0,1,1,1,1,1)
covariate=c(1,2,3,4,5,6,7,8,9,10)
X=cbind(1,covariate)
m=1000
fit=bayes.probit(response,X,m)
x1=c(1,3)
x2=c(1,8)
X1=rbind(x1,x2)
fittedprobs=bprobit.probs(X1,fit$beta)



