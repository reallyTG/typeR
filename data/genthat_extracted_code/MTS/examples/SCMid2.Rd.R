library(MTS)


### Name: SCMid2
### Title: Scalar Component Model Specification II
### Aliases: SCMid2

### ** Examples

phi=matrix(c(0.2,-0.6,0.3,1.1),2,2); sigma=diag(2)
m1=VARMAsim(300,arlags=c(1),phi=phi,sigma=sigma)
zt=m1$series
m2=SCMid2(zt)
names(m2)



