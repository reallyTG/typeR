library(IndTestPP)


### Name: NHD.fun
### Title: It estimates the cross D-function for two sets of point
###   processes
### Aliases: NHD.fun NHDaux prodN2 HDFaux nearestD nMenr

### ** Examples


#Sets  C and D with one  independent NHPP
set.seed(123)
lambda1<-runif(500, 0.05, 0.1)
set.seed(124)
lambda2<-runif(500, 0.01, 0.2)
pos1<-simNHPc.fun(lambda=lambda1, fixed.seed=123)$posNH
pos2<-simNHPc.fun(lambda=lambda2, fixed.seed=123)$posNH

aux<-NHD.fun(lambdaC=lambda1, lambdaD=lambda2, posC=pos1, typeC=1, posD=pos2, typeD=1)
aux$NHDr


#Sets  C and D with two independent NHPPs
#pos3<-simNHPc.fun(lambda=lambda1, fixed.seed=321)$posNH
#pos4<-simNHPc.fun(lambda=lambda2, fixed.seed=321)$posNH

#NHD.fun(lambdaC=cbind(lambda1,lambda2), lambdaD=cbind(lambda1,lambda2), posC=c(pos1,pos2), 
#	typeC=c(rep(1, length(pos1)), rep(2, length(pos2))), posD=c(pos3, pos4), 
#	typeD=c(rep(1, length(pos3)), rep(2, length(pos4))))






