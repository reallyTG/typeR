library(MTS)


### Name: Kronid
### Title: Kronecker Index Identification
### Aliases: Kronid

### ** Examples

phi=matrix(c(0.2,-0.6,.3,1.1),2,2); sigma=diag(2); theta=-0.5*sigma
m1=VARMAsim(300,arlags=c(1),malags=c(1),phi=phi,theta=theta,sigma=sigma)
zt=m1$series
Kronid(zt)



