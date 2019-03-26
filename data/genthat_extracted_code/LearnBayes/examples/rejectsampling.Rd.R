library(LearnBayes)


### Name: rejectsampling
### Title: Rejecting sampling using a t proposal density
### Aliases: rejectsampling
### Keywords: models

### ** Examples

data(cancermortality)
start=c(-7,6)
fit=laplace(betabinexch,start,cancermortality)
tpar=list(m=fit$mode,var=2*fit$var,df=4)
theta=rejectsampling(betabinexch,tpar,-569.2813,1000,cancermortality)



