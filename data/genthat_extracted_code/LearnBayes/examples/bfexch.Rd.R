library(LearnBayes)


### Name: bfexch
### Title: Logarithm of integral of Bayes factor for testing homogeneity of
###   proportions
### Aliases: bfexch
### Keywords: models

### ** Examples

y=c(1,3,2,4,6,4,3)
n=c(10,10,10,10,10,10,10)
data=cbind(y,n)
K=20
datapar=list(data=data,K=K)
theta=1
bfexch(theta,datapar)



