library(LearnBayes)


### Name: poissgamexch
### Title: Log posterior of Poisson/gamma exchangeable model
### Aliases: poissgamexch
### Keywords: models

### ** Examples

e=c(532,584,672,722,904)
y=c(0,0,2,1,1)
data=cbind(e,y)
theta=c(-4,0)
z0=.5
datapar=list(data=data,z0=z0)
poissgamexch(theta,datapar)



