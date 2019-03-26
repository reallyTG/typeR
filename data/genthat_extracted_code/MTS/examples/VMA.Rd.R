library(MTS)


### Name: VMA
### Title: Vector Moving Average Model
### Aliases: VMA

### ** Examples

theta=matrix(c(0.5,0.4,0,0.6),2,2); sigma=diag(2)
m1=VARMAsim(200,malags=c(1),theta=theta,sigma=sigma)
zt=m1$series
m2=VMA(zt,q=1,include.mean=FALSE)



