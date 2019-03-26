library(AssetCorr)


### Name: interALL
### Title: Function to use multiple estimators simultaneously
### Aliases: interALL
### Keywords: ALL ALL

### ** Examples


## No test: 
set.seed(111)
Psi=rmvnorm(20,sigma=matrix(c(1,0.5,0.5,1),2))
PDcond1=pnorm((qnorm(0.01)-sqrt(0.05)*Psi[,1])/sqrt(1-0.05))
PDcond2=pnorm((qnorm(0.01)-sqrt(0.2)*Psi[,2])/sqrt(1-0.2))

D1=rbinom(20,1000,PDcond1)
D2=rbinom(20,1000,PDcond2)

N1=N2=rep(1000,20)

DTS=cbind(D1,D2)
N=cbind(N1,N2)

rho1=intraMLE(D1,N1)$Original
rho2=intraMLE(D2,N2)$Original

#Point Estimates
interALL(D1,N1,D2,N2,rho1,rho2, plot=TRUE)

#Bootstrap corrected estimates of all available estimators:
InterCorr=interALL(D1,N1,D2,N2,rho1,rho2, B=500, CI_Boot=0.95 , plot=TRUE, show_progress=TRUE)


#Jackknife correction
InterCorr=interALL(D1,N1,D2,N2,rho1,rho2, JC=TRUE, plot=TRUE)

#Double Bootstrap correction with 10 repetitions in the inner loop and 50 in the outer loop
InterCorr=interALL(D1,N1,D2,N2,rho1,rho2, DB=c(10,50), plot=TRUE)

## End(No test)





