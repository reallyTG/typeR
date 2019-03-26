library(asbio)


### Name: ci.mu.z
### Title: Z and t confidence intervals for mu.
### Aliases: ci.mu.z ci.mu.t print.ci
### Keywords: univar htest

### ** Examples

#With summarized=FALSE 
x<-c(5,10,5,20,30,15,20,25,0,5,10,5,7,10,20,40,30,40,10,5,0,0,3,20,30)
ci.mu.z(x,conf=.95,sigma=4,summarized=FALSE)
ci.mu.t(x,conf=.95,summarized=FALSE)
#With summarized = TRUE
ci.mu.z(x,conf=.95,sigma=4,xbar=14.6,n=25,summarized=TRUE)
ci.mu.t(x,conf=.95,sd=4,xbar=14.6,n=25,summarized=TRUE)
#with finite population correction and summarized = TRUE
ci.mu.z(x,conf=.95,sigma=4,xbar=14.6,n=25,summarized=TRUE,fpc=TRUE,N=100)
ci.mu.t(x,conf=.95,sd=4,xbar=14.6,n=25,summarized=TRUE,fpc=TRUE,N=100)



