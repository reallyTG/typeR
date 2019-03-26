library(AssetCorr)


### Name: analyze_AssetCorr
### Title: Function to evaluate several default time series simultaneously
### Aliases: analyze_AssetCorr
### Keywords: ALL ALL

### ** Examples


## No test: 
library(mvtnorm)
set.seed(111)
NoO=1000 #Number of obligors in each sector
Years=20
AC=0.3
PD=0.01

Psi=rmvnorm(Years,sigma=matrix(c(1,0.5,0.5,0.5,1,0.5,0.5,0.5,1),3))
PDcond1=pnorm((qnorm(PD)-sqrt(AC)*Psi[,1])/sqrt(1-AC))
PDcond2=pnorm((qnorm(PD)-sqrt(AC/2)*Psi[,2])/sqrt(1-AC/2))
PDcond3=pnorm((qnorm(PD)-sqrt(AC*2)*Psi[,3])/sqrt(1-AC*2))

DTS=cbind(rbinom(Years,NoO,PDcond1),rbinom(Years,NoO,PDcond2),rbinom(Years,NoO,PDcond3))
N=matrix(NoO,nrow = Years,ncol = 3)

Output<-analyze_AssetCorr(DTS,N)

#Bootstrap Correction and CIs

Output<-analyze_AssetCorr(DTS,N,B=100,CI_Boot=0.95)

#Double Bootstrap Correction and Jackknife
Output<-analyze_AssetCorr(DTS,N,DB=c(50,50),JC=TRUE)



## End(No test)





