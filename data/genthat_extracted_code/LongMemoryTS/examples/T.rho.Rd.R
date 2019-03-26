library(LongMemoryTS)


### Name: T.rho
### Title: Test for equality of all elements in an estimated d-vector based
###   on pairwise comparisons.
### Aliases: T.rho

### ** Examples

library(fracdiff)
T<-1000
d1<-0.2
d2<-0.4
X<-cbind(fracdiff.sim(n=T,d=d1)$series,fracdiff.sim(n=T,d=d1)$series,
fracdiff.sim(n=T,d=d2)$series,fracdiff.sim(n=T,d=d2)$series)
alpha<-0.05
m1<-floor(1+T^0.75)
m<-floor(1+T^0.65)
lW.wrap<-function(data,m){local.W(data,m)$d}
d.hat<-apply(X,2,lW.wrap, m=m1)
T.rho(data=X, d.hat=d.hat, m=m, m1=m1)



