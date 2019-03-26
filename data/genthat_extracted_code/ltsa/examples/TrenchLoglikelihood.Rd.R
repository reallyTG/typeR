library(ltsa)


### Name: TrenchLoglikelihood
### Title: Loglikelihood function of stationary time series using Trench
###   algorithm
### Aliases: TrenchLoglikelihood
### Keywords: ts

### ** Examples

#compute loglikelihood for white noise
z<-rnorm(100)
TrenchLoglikelihood(c(1,rep(0,length(z)-1)), z)


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



