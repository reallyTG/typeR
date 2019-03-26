library(LearnBayes)


### Name: reg.gprior.post
### Title: Computes the log posterior of a normal regression model with a g
###   prior.
### Aliases: reg.gprior.post
### Keywords: models

### ** Examples

data(puffin)
data=list(y=puffin$Nest, X=cbind(1,puffin$Distance))
prior=list(b0=c(0,0), c0=10)
reg.gprior.post(c(20,-.5,1),list(data=data,prior=prior))



