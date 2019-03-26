library(IndTestPP)


### Name: TestIndNH.fun
### Title: Calculate a bootstrap test to check the independence between up
###   to three nonhomogeneous Poisson or point processes in time
### Aliases: TestIndNH.fun mirank.fun miKS.fun fn2 fn2fix

### ** Examples


#Test applied to 3  independent NHPP
set.seed(123)
lambdax<-runif(150, 0.01,0.1)
set.seed(124)
lambday<-runif(150, 0.02,0.1)
set.seed(125)
lambdaz<-runif(150, 0.015,0.1)
posx<-simNHPc.fun(lambdax, fixed.seed=123)$posNH
posy<-simNHPc.fun(lambday, fixed.seed=124)$posNH
posz<-simNHPc.fun(lambdaz, fixed.seed=125)$posNH

aux<-TestIndNH.fun(posx, posy, posz, nsim=50, type='Poisson', 
	NumProcess=3,lambdaMarg=cbind(lambday,lambdaz), fixed.seed=321)
aux$KSpv




#Test applied to 3 dependent NS cluster processes with 2 cores
#set.seed(123)
#lambdaParent<-runif(500,0,0.1)
#DepPro<-DepNHNeyScot.fun(lambdaParent=lambdaParent, d=3, lambdaNumP = 3, 
#	 dist = "normal", sigmaC = 1, fixed.seed=123,cores=2)
#posx<-DepPro$PP1
#posy<-DepPro$PP2
#posz<-DepPro$PP3
#aux<-TestIndNH.fun(posx, posy, posz, cores=1, type='PoissonCluster',
#	NumProcess=3,lambdaParent = lambdaParent, lambdaNumP = 3, 
#	dist = "normal", sigmaC = 1, fixed.seed=123, nsim=200)
#aux$KSpv





