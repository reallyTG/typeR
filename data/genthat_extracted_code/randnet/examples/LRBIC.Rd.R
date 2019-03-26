library(randnet)


### Name: LRBIC
### Title: selecting number of communities by asymptotic likelihood ratio
### Aliases: LRBIC
### Keywords: community detection

### ** Examples



dt <- BlockModel.Gen(30,300,K=3,beta=0.2,rho=0.9,simple=FALSE,power=TRUE)


A <- dt$A


### test LRBIC

lrbic <- LRBIC(A,6,model="both")

lrbic$SBM.K

lrbic$DCSBM.K




