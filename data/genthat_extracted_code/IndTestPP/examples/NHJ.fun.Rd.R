library(IndTestPP)


### Name: NHJ.fun
### Title: It estimates the cross J-function for two sets of point
###   processes
### Aliases: NHJ.fun NHJaux NHDFaux Jenv

### ** Examples


set.seed(122)
lambda1<-runif(100, 0.05, 0.1)
set.seed(121)
lambda2<-runif(100, 0.01, 0.2)
pos1<-simNHPc.fun(lambda=lambda1,fixed.seed=123)$posNH  
pos2<-simNHPc.fun(lambda=lambda2,fixed.seed=123)$posNH

aux<-NHJ.fun(lambdaC=lambda1, lambdaD=lambda2, posC=pos1,nTrans=50, 
	 posD=pos2, rTest=7, dplot='J', cores=1,test=TRUE)
aux$pv


#Sets with two processes
#pos3<-simNHPc.fun(lambda=lambda1,fixed.seed=321)$posNH  
#pos4<-simNHPc.fun(lambda=lambda2,fixed.seed=321)$posNH 
#aux<-NHJ.fun(lambdaC=cbind(lambda1,lambda2), lambdaD=cbind(lambda1,lambda2), 
#	posC=c(pos1,pos2), typeC=c(rep(1, length(pos1)), rep(2, length(pos2))), 
#	posD=c(pos3, pos4), typeD=c(rep(1, length(pos3)), rep(2, length(pos4))), 
#	dplot='J', test=TRUE)
#aux$pv




