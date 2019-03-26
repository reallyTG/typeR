library(randnet)


### Name: reg.SSP
### Title: detects communities by regularized spherical spectral clustering
### Aliases: reg.SSP
### Keywords: community detection

### ** Examples



dt <- BlockModel.Gen(30,300,K=3,beta=0.2,rho=0.9,simple=FALSE,power=TRUE)


A <- dt$A

ssc <- reg.SSP(A,K=3,lap=TRUE)

NMI(ssc$cluster,dt$g)




