library(binseqtest)


### Name: unirootDiscrete
### Title: Identify where a non-increasing function changes sign
### Aliases: unirootDiscrete
### Keywords: math

### ** Examples

test<-function(x,parm=10.987654321){ ifelse(x>=parm,1,-1) }
unirootDiscrete(test,lower=0,upper=100,tol=10^-4,pos.side=FALSE,print.steps=TRUE)



