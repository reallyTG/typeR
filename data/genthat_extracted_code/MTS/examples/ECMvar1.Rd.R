library(MTS)


### Name: ECMvar1
### Title: Error-Correction VAR Model 1
### Aliases: ECMvar1

### ** Examples

phi=matrix(c(0.5,-0.25,-1.0,0.5),2,2); theta=matrix(c(0.2,-0.1,-0.4,0.2),2,2)
Sig=diag(2)
mm=VARMAsim(300,arlags=c(1),malags=c(1),phi=phi,theta=theta,sigma=Sig)
zt=mm$series
wt=0.5*zt[,1]+zt[,2]
m1=ECMvar1(zt,3,wt)
names(m1)



