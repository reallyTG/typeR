library(MTS)


### Name: ECMvar
### Title: Error-Correction VAR Models
### Aliases: ECMvar

### ** Examples

phi=matrix(c(0.5,-0.25,-1.0,0.5),2,2); theta=matrix(c(0.2,-0.1,-0.4,0.2),2,2)
Sig=diag(2)
mm=VARMAsim(300,arlags=c(1),malags=c(1),phi=phi,theta=theta,sigma=Sig)
zt=mm$series[,c(2,1)]
beta=matrix(c(1,0.5),2,1)
m1=ECMvar(zt,3,ibeta=beta)
names(m1)



