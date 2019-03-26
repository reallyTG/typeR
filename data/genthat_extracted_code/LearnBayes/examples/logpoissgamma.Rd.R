library(LearnBayes)


### Name: logpoissgamma
### Title: Log posterior with Poisson sampling and gamma prior
### Aliases: logpoissgamma
### Keywords: models

### ** Examples

data=c(2,4,3,6,1,0,4,3,10,2)
par=c(1,1)
datapar=list(data=data,par=par)
theta=c(-1,0,1,2)
logpoissgamma(theta,datapar)



