library(CepLDA)


### Name: r.cond.ar2
### Title: Generate Random AR(2) Time Series
### Aliases: r.cond.ar2

### ** Examples

## Simulate data
nj = 50  #number of series in training data
N = 500  #length of time series
data1 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.01,.7),r.phi2=c(-.12,-.06),r.sig2=c(.3,3))
data2 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.5,1.2),r.phi2=c(-.36,-.25),r.sig2=c(.3,3))
data3 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.9,1.5),r.phi2=c(-.56,-.75),r.sig2=c(.3,3))
data <- cbind(data1$X,data2$X,data3$X)
y <- c(rep(1,nj),rep(2,nj),rep(3,nj))  



