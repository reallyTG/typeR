library(NTS)


### Name: ref.mTAR
### Title: Refine A Fitted 2-Regime Multivariate TAR Model
### Aliases: ref.mTAR

### ** Examples

phi1=matrix(c(0.5,0.7,0.3,0.2),2,2)
phi2=matrix(c(0.4,0.6,0.5,-0.5),2,2)
sigma1=matrix(c(1,0,0,1),2,2)
sigma2=matrix(c(1,0,0,1),2,2)
c1=c(0,0)
c2=c(0,0)
delay=c(1,1)
y=mTAR.sim(100,0,phi1,phi2,sigma1,sigma2,c1,c2,delay,ini=500)
est=mTAR.est(y$series,c(1,1),0,delay)
ref.mTAR(est,0)



