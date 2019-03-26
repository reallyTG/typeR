library(IndTestPP)


### Name: NHF.fun
### Title: It estimates the cross F-function for two sets of point
###   processes
### Aliases: NHF.fun NHFaux

### ** Examples


set.seed(123)
lambda1<-runif(500, 0.05, 0.1)
pos1<-simNHPc.fun(lambda=lambda1, fixed.seed=123)$posNH

aux<-NHF.fun(lambdaD=lambda1, posD=pos1, typeD=1)
aux$NHFr

#Set D with two processes
#lambda2<-runif(1000, 0.01, 0.2)
#pos2<-simNHPc.fun(lambda=lambda2, fixed.seed=123)$posNH
#NHF.fun(lambdaD=cbind(lambda1,lambda2), posD=c(pos1,pos2), 
#	typeD=c(rep(1, length(pos1)), rep(2, length(pos2))) )




