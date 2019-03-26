library(MTS)


### Name: MTSdiag
### Title: Multivariate Time Series Diagnostic Checking
### Aliases: MTSdiag

### ** Examples

phi=matrix(c(0.2,-0.6,0.3,1.1),2,2); sigma=diag(2)
m1=VARMAsim(200,arlags=c(1),phi=phi,sigma=sigma)
zt=m1$series
m2=VAR(zt,1,include.mean=FALSE)
MTSdiag(m2)



