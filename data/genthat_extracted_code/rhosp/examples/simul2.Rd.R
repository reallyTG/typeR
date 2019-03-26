library(rhosp)


### Name: simul2
### Title: simulate the second model of the hospital risk
### Aliases: simul2
### Keywords: utilities

### ** Examples

arg1Exp<-list(rangen=rexp,nbparam=1,param=list(1/2));
arg2Exp<-list(rangen=rexp,nbparam=1,param=list(1/20));
T<-simul2(100,arg1Exp,arg2Exp)




