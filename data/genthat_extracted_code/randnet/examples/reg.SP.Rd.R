library(randnet)


### Name: reg.SP
### Title: clusters nodes by regularized spectral clustering
### Aliases: reg.SP
### Keywords: community detection

### ** Examples



dt <- BlockModel.Gen(30,300,K=3,beta=0.2,rho=0)


A <- dt$A


sc <- reg.SP(A,K=3,lap=TRUE)


NMI(sc$cluster,dt$g)





