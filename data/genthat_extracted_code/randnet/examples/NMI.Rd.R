library(randnet)


### Name: NMI
### Title: calculates normalized mutual information
### Aliases: NMI

### ** Examples


dt <- BlockModel.Gen(30,300,K=3,beta=0.2,rho=0.9,simple=FALSE,power=TRUE)


A <- dt$A


ssc <- reg.SSP(A,K=3,lap=TRUE)

NMI(ssc$cluster,dt$g)





