library(randnet)


### Name: SBM.estimate
### Title: estimates SBM parameters given community labels
### Aliases: SBM.estimate
### Keywords: SBM

### ** Examples


dt <- BlockModel.Gen(30,300,K=3,beta=0.2,rho=0)


A <- dt$A


sc <- reg.SP(A,K=3,lap=TRUE)
sbm <- SBM.estimate(A,sc$cluster)
sbm$B




