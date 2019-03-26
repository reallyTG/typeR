library(AdvBinomApps)


### Name: phi.mult.ref
### Title: Downscaling of failures to greatest common chip size
### Aliases: phi.mult.ref
### Keywords: area scaling

### ** Examples

k<-c(1,2)
n<-c(10,15)
A.ref<-c(2,3)
phi.mult.ref(k,n,A.ref)

k<-c(1,1)
n<-c(110000,220000)
A.ref<-c(5.21,10.71)
phi.mult.ref(k,n,A.ref)

k<-c(1,2,3,4)
n<-c(10,15,20,30)
A.ref<-c(1,2,3,4)
phi.mult.ref(k,n,A.ref)



