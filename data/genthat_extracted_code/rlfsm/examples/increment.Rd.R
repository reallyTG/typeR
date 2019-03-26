library(rlfsm)


### Name: increment
### Title: Higher order increments
### Aliases: increment

### ** Examples


m<-45; M<-60; N<-2^10-M
alpha<-0.8; H<-0.8; sigma<-0.3

lfsm<-path(N=N,m=m,M=M,alpha=alpha,H=H,
           sigma=sigma,freq='L',disable_X=FALSE,seed=3)$lfsm

tryCatch(
increment(r=1,i=length(lfsm),k=length(lfsm)+100,path=lfsm),
error=function(c) 'An error occures when k is larger then the length of the sample path')

increment(r=3,i=50,k=3,path=lfsm)




