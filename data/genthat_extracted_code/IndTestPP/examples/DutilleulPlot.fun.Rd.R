library(IndTestPP)


### Name: DutilleulPlot.fun
### Title: Performs a Diggle's randomization testing procedure to check
###   independence between two point processes
### Aliases: DutilleulPlot.fun fn3

### ** Examples


#Two independent NHPPs
set.seed(123)
lambdax<-runif(200, 0.01,0.1)
set.seed(124)
lambday<-runif(200, 0.015,0.15)
posx<-simNHPc.fun(lambdax,fixed.seed=123)$posNH
posy<-simNHPc.fun(lambday, fixed.seed=123)$posNH

aux<-DutilleulPlot.fun(posx, posy, lambday,  nsim = 100)


#Two dependent NSPs
#set.seed(123)
#lambdaParent<-runif(200)/10
#DepPro<-DepNHNeyScot.fun(lambdaParent=lambdaParent, d=2, lambdaNumP = 3, 
#	dist = "normal", sigmaC = 3,fixed.seed=123)
#posx<-DepPro$PP1
#posy<-DepPro$PP2
#aux<-DutilleulPlot.fun(posx, posy, lambday, nsim = 100)



