library(emdbook)


### Name: deltamethod
### Title: Delta method functions
### Aliases: deltamethod deltavar
### Keywords: misc

### ** Examples

deltamethod(a*x/(b+x),runif(50),params=list(a=1,b=1),max.order=9)
deltavar(scale*gamma(1+1/shape),meanval=c(scale=0.8,shape=12),
   Sigma=matrix(c(0.015,0.125,0.125,8.97),nrow=2))
## more complex deltavar example
xvec = seq(-4,4,length=101)
x1 = xvec
x2 = xvec
v = matrix(0.2,nrow=3,ncol=3)
diag(v) = 1
m = c(b0=1,b1=1.5,b2=1)
v3  = deltavar(1/(1+exp(-(b0+b1*x1+b2*x2))),meanval=m,Sigma=v)
plot(xvec,v3)



