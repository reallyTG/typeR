library(clinDR)


### Name: emaxfun
### Title: Vectorized versions of the hyperbolic and sigmoidal Emax models
### Aliases: emaxfun
### Keywords: nonlinear

### ** Examples


doselev<-c(0,5,25,50,100)
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
lambda=2
parm<-c(log(ed50),lambda,emax,e0)
plot(doselev,emaxfun(doselev,parm))




