library(NTS)


### Name: mTAR
### Title: Estimation of a Multivariate Two-Regime SETAR Model
### Aliases: mTAR

### ** Examples

phi1=matrix(c(0.5,0.7,0.3,0.2),2,2)
phi2=matrix(c(0.4,0.6,0.5,-0.5),2,2)
sigma1=matrix(c(1,0,0,1),2,2)
sigma2=matrix(c(1,0,0,1),2,2)
c1=c(0,0)
c2=c(0,0)
delay=c(1,1)
Trim=c(0.2,0.8)
include.mean=TRUE
y=mTAR.sim(1000,0,phi1,phi2,sigma1,sigma2,c1,c2,delay,ini=500)
est=mTAR(y$series,1,1,0,y$series,delay,Trim,300,include.mean,"AIC")
est2=mTAR(y$series,1,1,NULL,y$series,delay,Trim,300,include.mean,"AIC")



