library(LearnBayes)


### Name: sir
### Title: Sampling importance resampling
### Aliases: sir
### Keywords: models

### ** Examples

data(cancermortality)
start=c(-7,6)
fit=laplace(betabinexch,start,cancermortality)
tpar=list(m=fit$mode,var=2*fit$var,df=4)
theta=sir(betabinexch,tpar,1000,cancermortality)



