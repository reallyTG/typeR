library(LearnBayes)


### Name: impsampling
### Title: Importance sampling using a t proposal density
### Aliases: impsampling
### Keywords: models

### ** Examples

data(cancermortality)
start=c(-7,6)
fit=laplace(betabinexch,start,cancermortality)
tpar=list(m=fit$mode,var=2*fit$var,df=4)
myfunc=function(theta) return(theta[2])
theta=impsampling(betabinexch,tpar,myfunc,1000,cancermortality)



