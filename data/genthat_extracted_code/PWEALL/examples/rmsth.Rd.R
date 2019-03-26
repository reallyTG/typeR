library(PWEALL)


### Name: rmsth
### Title: Estimate the restricted mean survival time (RMST) and its
###   variance from data
### Aliases: rmsth
### Keywords: restricted mean survival time variance

### ** Examples

lamt<-0.8
lamc<-0.4
n<-3000
tcut<-2.0
truermst<-(1-exp(-lamt*tcut))/lamt
tt<-rexp(n)/lamt
cc<-rexp(n)/lamc
yy<-pmin(tt,cc)
dd<-rep(1,n)
dd[tt>cc]<-0
aest<-rmsth(y=yy,d=dd,tcut=tcut)
aest



