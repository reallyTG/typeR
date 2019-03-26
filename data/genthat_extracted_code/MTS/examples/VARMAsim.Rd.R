library(MTS)


### Name: VARMAsim
### Title: Generating a VARMA Process
### Aliases: VARMAsim

### ** Examples

p1=matrix(c(0.2,-0.6,0.3,1,1),2,2)
sig=matrix(c(4,0.8,0.8,1),2,2)
th1=matrix(c(-0.5,0,0,-0.6),2,2)
m1=VARMAsim(300,arlags=c(1),malags=c(1),phi=p1,theta=th1,sigma=sig)
zt=m1$series



