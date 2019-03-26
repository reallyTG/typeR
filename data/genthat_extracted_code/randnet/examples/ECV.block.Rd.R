library(randnet)


### Name: ECV.block
### Title: selecting block models by ECV
### Aliases: ECV.block
### Keywords: ECV

### ** Examples


dt <- BlockModel.Gen(30,300,K=3,beta=0.2,rho=0.9,simple=FALSE,power=TRUE)


A <- dt$A

ecv <- ECV.block(A,6,B=3)

ecv$l2.model
ecv$dev.model


which.min(ecv$l2)
which.min(ecv$dev)

which.min(ecv$dc.l2)
which.min(ecv$dc.dev)

which.max(ecv$auc)
which.min(ecv$sse)




