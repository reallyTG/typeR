library(MTS)


### Name: BVAR
### Title: Bayesian Vector Autoregression
### Aliases: BVAR

### ** Examples

data("mts-examples",package="MTS")
z=log(qgdp[,3:5])
zt=diffM(z)*100
C=0.1*diag(rep(1,7))
V0=diag(rep(1,3))
BVAR(zt,p=2,C,V0)



