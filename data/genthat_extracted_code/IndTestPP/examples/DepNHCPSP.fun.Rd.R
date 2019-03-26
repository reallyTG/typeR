library(IndTestPP)


### Name: DepNHCPSP.fun
### Title: Generates a trajectory of two dependent Poisson processes from a
###   Common Poisson shock process
### Aliases: DepNHCPSP.fun

### ** Examples

set.seed(123)
lambdai1<-runif(200,0,0.1)
set.seed(124)
lambdai2<-runif(200,0,0.07)
set.seed(125)
lambdai12<-runif(200,0,0.15)

aux<-DepNHCPSP.fun(lambdai1=lambdai1, lambdai2=lambdai2, lambdai12=lambdai12,
	fixed.seed=123)

aux$posNH1
aux$posNH2



