library(MTS)


### Name: VARMACpp
### Title: Vector Autoregressive Moving-Average Models (Cpp)
### Aliases: VARMACpp

### ** Examples

phi=matrix(c(0.2,-0.6,0.3,1.1),2,2); theta=matrix(c(-0.5,0,0,-0.5),2,2)
sigma=diag(2)
m1=VARMAsim(300,arlags=c(1),malags=c(1),phi=phi,theta=theta,sigma=sigma)
zt=m1$series
m2=VARMA(zt,p=1,q=1,include.mean=FALSE)



