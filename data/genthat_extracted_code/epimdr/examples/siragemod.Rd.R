library(epimdr)


### Name: siragemod
### Title: Gradient-function for the age-structured SIR model with possibly
###   heterogeneous mixin
### Aliases: siragemod

### ** Examples

a=rep(1,4)
n=length(a)
betaM=matrix(1, ncol=4, nrow=4)
pars =list(N=1, gamma=365/14, mu=0.02, sigma=0.2, beta=500, betaM=betaM,p=rep(0,4), a=a)
xstart<-log(c(S=rep(0.099/n,n), I=rep(0.001/n,n), R=rep(0.9/n,n)))
times=seq(0,10,by=14/365)
out=as.data.frame(ode(xstart, times=times, func=siragemod, parms=pars))



