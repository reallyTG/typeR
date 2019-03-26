library(expperm)


### Name: gray
### Title: Gray code enumeration
### Aliases: gray

### ** Examples

n<-4
indi<-rep(0,n)
allinds<-c()
for(i in 1:(2^n)){
  allinds<-rbind(allinds,indi)
  indi<-gray(indi)
}
allinds



