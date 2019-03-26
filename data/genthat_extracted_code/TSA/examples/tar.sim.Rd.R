library(TSA)


### Name: tar.sim
### Title: Simulate a two-regime TAR model
### Aliases: tar.sim
### Keywords: methods

### ** Examples

set.seed(1234579)
y=tar.sim(n=100,Phi1=c(0,0.5),
Phi2=c(0,-1.8),p=1,d=1,sigma1=1,thd=-1,
sigma2=2)$y
plot(y=y,x=1:100,type='b',xlab="t",ylab=expression(Y[t]))



