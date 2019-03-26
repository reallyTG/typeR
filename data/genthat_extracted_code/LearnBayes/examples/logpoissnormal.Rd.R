library(LearnBayes)


### Name: logpoissnormal
### Title: Log posterior with Poisson sampling and normal prior
### Aliases: logpoissnormal
### Keywords: models

### ** Examples

data=c(2,4,3,6,1,0,4,3,10,2)
par=c(0,1)
datapar=list(data=data,par=par)
theta=c(-1,0,1,2)
logpoissnormal(theta,datapar)



