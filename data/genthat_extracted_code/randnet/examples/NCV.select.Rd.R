library(randnet)


### Name: NCV.select
### Title: selecting block models by NCV
### Aliases: NCV.select
### Keywords: community detection

### ** Examples


dt <- BlockModel.Gen(30,300,K=3,beta=0.2,rho=0.9,simple=FALSE,power=TRUE)


A <- dt$A


ncv <- NCV.select(A,6,3)

ncv$l2.model
ncv$dev.model

which.min(ncv$dev)
which.min(ncv$l2)

which.min(ncv$dc.dev)
which.min(ncv$dc.l2)




