library(randnet)


### Name: BHMC.estimate
### Title: Estimates the number of communities under block models by the
###   spectral methods
### Aliases: BHMC.estimate
### Keywords: community detection

### ** Examples


dt <- BlockModel.Gen(30,300,K=3,beta=0.2,rho=0.9,simple=FALSE,power=TRUE)


A <- dt$A


bhmc <- BHMC.estimate(A,15)

bhmc




