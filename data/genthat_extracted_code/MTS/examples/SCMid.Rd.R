library(MTS)


### Name: SCMid
### Title: Scalar Component Identification
### Aliases: SCMid

### ** Examples

phi=matrix(c(0.2,-0.6,0.3,1.1),2,2); sigma=diag(2)
m1=VARMAsim(300,arlags=c(1),phi=phi,sigma=sigma)
zt=m1$series
m2=SCMid(zt)



