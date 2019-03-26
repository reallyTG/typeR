library(hbmem)


### Name: normalSim
### Title: Function normalSim
### Aliases: normalSim

### ** Examples

library(hbmem)
I=20
J=50
R=I*J
dat=normalSim(I=I,J=J,mu=10,s2a=1,s2b=1,muS2=log(1),s2aS2=0,s2bS2=0)
summary(dat)



