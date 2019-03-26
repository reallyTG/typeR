library(expperm)


### Name: coollex
### Title: Computing combinations with the Coollex algorithm
### Aliases: coollex

### ** Examples

n<-4
k<-2
indi<-c(rep(1,k),rep(0,n-k))
attr(indi,"i1")<-attr(indi,"i2")<-k
allinds<-indi
for(i in 2:choose(n,k)){
 indi<-coollex(indi,attr(indi,"i1"),attr(indi,"i2"))
 allinds<-rbind(allinds,indi)
}
allinds



