library(LongMemoryTS)


### Name: rank.est
### Title: Cointegration Rank Estimation using Model Selection.
### Aliases: rank.est

### ** Examples

library(fracdiff)
T<-2000
d<-0.4
m1<-floor(1+T^0.75)
m<-floor(1+T^0.65)
xt<-fracdiff.sim(n=T, d=d)$series
yt<-xt+rnorm(T)
zt<-xt+rnorm(T)
X<-cbind(xt,yt,zt)
lW.wrap<-function(data,m){local.W(data,m)$d}
d.hat<-apply(X,2,lW.wrap, m=m1)
rank.est(data=X, d.hat, m=m, m1=m1)



