library(LongMemoryTS)


### Name: MLWS
### Title: MLWS test for multivariate spurious long memory.
### Aliases: MLWS

### ** Examples

T<-500
m<-floor(1+T^0.75)
series<-FI.sim(T=T,q=2,rho=0.7,d=c(0.4,0.2))
ts.plot(series, col=1:2)
MLWS(X=series, m=m, epsilon=0.05)

shift.series<-series+ARRLS.sim(T=T, phi=0, sig.shift=2, prob=5/T)
ts.plot(shift.series, col=1:2)
MLWS(X=shift.series, m=m, epsilon=0.05)

T<-500
m<-floor(T^0.75)
series<-FI.sim(T=T,q=2,rho=0,d=c(0.1,0.4), B=rbind(c(1,-1),c(0,1)))
ts.plot(series, col=1:2)
MLWS(series, m=m)
MLWS(series, m=m, coint.elements=c(1,2))



