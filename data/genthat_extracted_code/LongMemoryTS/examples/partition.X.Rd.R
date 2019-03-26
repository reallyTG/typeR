library(LongMemoryTS)


### Name: partition.X
### Title: Automated partitioning of estimated vector of long memory
###   parameters into subvectors with equal memory.
### Aliases: partition.X

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
d.hat<-c(local.W(X[,1],m=m1)$d,local.W(X[,2],m=m1)$d,local.W(X[,3],m=m1)$d,local.W(X[,4],m=m1)$d)
partition.X(data=X, d.hat=d.hat, m=m, m1=m1, alpha=0.05, report=TRUE)



