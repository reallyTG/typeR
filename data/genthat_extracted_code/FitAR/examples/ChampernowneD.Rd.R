library(FitAR)


### Name: ChampernowneD
### Title: Champernowne Matrix
### Aliases: ChampernowneD
### Keywords: ts

### ** Examples

#compute the exact concentrated loglikelihood function, (McLeod & Zhang, 2006, eq.(6)),
# for AR(p) fitted by Yule-Walker to logged lynx data
#
p<-8
CD<-ChampernowneD(log(lynx), p)
n<-length(lynx)
phi<-ar(log(lynx), order.max=p, aic=FALSE, method="yule-walker")$ar
LoglYW<-FastLoglikelihoodAR(phi,n,CD)
phi<-ar(log(lynx), order.max=p, aic=FALSE, method="burg")$ar
LoglBurg<-FastLoglikelihoodAR(phi,n,CD)
phi<-ar(log(lynx), order.max=p, aic=FALSE, method="ols")$ar
LoglOLS<-FastLoglikelihoodAR(phi,n,CD)
phi<-ar(log(lynx), order.max=p, aic=FALSE, method="mle")$ar
LoglMLE<-FastLoglikelihoodAR(phi,n,CD)
ans<-c(LoglYW,LoglBurg,LoglOLS,LoglMLE)
names(ans)<-c("YW","Burg","OLS","MLE")
ans
#compare the MLE result given by ar with that given by FitAR
FitAR(log(lynx),p)



