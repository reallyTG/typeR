library(MTS)


### Name: VMACpp
### Title: Vector Moving Average Model (Cpp)
### Aliases: VMACpp

### ** Examples

theta=matrix(c(0.5,0.4,0,0.6),2,2); sigma=diag(2)
m1=VARMAsim(200,malags=c(1),theta=theta,sigma=sigma)
zt=m1$series
m2=VMACpp(zt,q=1,include.mean=FALSE)



