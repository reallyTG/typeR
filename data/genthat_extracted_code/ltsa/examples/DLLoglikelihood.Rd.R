library(ltsa)


### Name: DLLoglikelihood
### Title: Durbin-Levinsion Loglikelihood
### Aliases: DLLoglikelihood
### Keywords: ts

### ** Examples

#Example 1
#compute loglikelihood for white noise
z<-rnorm(100)
DLLoglikelihood(c(1,rep(0,length(z)-1)), z)

#Example 2
#simulate a time series and compute the concentrated loglikelihood using DLLoglikelihood and
#compare this with the value given by TrenchLoglikelihood.
phi<-0.8
n<-200
r<-phi^(0:(n-1))
z<-arima.sim(model=list(ar=phi), n=n)
LD<-DLLoglikelihood(r,z)
LT<-TrenchLoglikelihood(r,z)
ans<-c(LD,LT)
names(ans)<-c("DLLoglikelihood","TrenchLoglikelihood")

#Example 3
## Not run: 
##D #Compare direct evaluation of AR(1) loglikelihood with DL method
##D #First define the exact concentrated loglikelihood function for AR(1)
##D AR1Loglikelihood <-function(phi,z){
##D n<-length(z)
##D S<-(z[1]^2)*(1-phi^2) + sum((z[-1]-phi*z[-n])^2)
##D 0.5*log(1-phi^2)-(n/2)*log(S/n)
##D }
##D #Next run script to compare numerically the loglikelihoods.
##D #They should be identical.
##D phi<-0.8
##D n<-200
##D z<-arima.sim(list(ar=phi), n=n)
##D phis<-seq(0.1,0.95,0.05)
##D ansAR1<-ansDL<-numeric(length(phis))
##D for (i in 1:length(phis)) {
##D     ansAR1[i] <- AR1Loglikelihood(phis[i],z)
##D     r<-(1/(1-phis[i]^2))*phis[i]^(0:(n-1))
##D     ansDL[i] <- DLLoglikelihood(r,z,useC=FALSE)
##D }
##D ans<-matrix(c(ansDL,ansAR1),ncol=2)
##D dimnames(ans)<-list(phis, c("DL-method","AR1-method"))
## End(Not run)

#Example 4
## Not run: 
##D #compare timings. See (McLeod, Yu, Krougly, Table 8).
##D  n<-5000
##D  ds<-c(-0.45, -0.25, -0.05, 0.05, 0.25, 0.45)
##D  tim<-matrix(numeric(3*length(ds)),ncol=3)
##D  for (i in 1:length(ds)){
##D     d<-ds[i]
##D     alpha <- 1-2*d #equivalent hyperbolic autocorrelation
##D     r <- (1/(1:n))^alpha
##D     z<-DLSimulate(n,r)
##D     tim1a<-system.time(LL1<-DLLoglikelihood(r,z))[1]
##D     tim1b<-system.time(LL1<-DLLoglikelihood(r,z,useC=FALSE))[1]
##D     tim2<-system.time(LL2<-TrenchLoglikelihood(r,z))[1]
##D     tim[i,]<-c(tim1a,tim1b, tim2)
##D     }
##D  dimnames(tim)<-list(ds, c("DL-C","DL-R","Trench"))
##D  tim
## End(Not run)



