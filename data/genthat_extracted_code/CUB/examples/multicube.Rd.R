library(CUB)


### Name: multicube
### Title: Joint plot of estimated CUBE models in the parameter space
### Aliases: multicube
### Keywords: device

### ** Examples

m1<-5; m2<-7;  m3<-9
pai<-0.7;csi<-0.6;phi=0.1
n1<-1000; n2<-500; n3<-1500
ord1<-simcube(n1,m1,pai,csi,phi)
ord2<-simcube(n2,m2,pai,csi,phi)
ord3<-simcube(n3,m3,pai,csi,phi)
listord<-list(ord1,ord2,ord3)
multicube(listord,labels=c("m=5","m=7","m=9"),pos=c(3,1,4),expinform=TRUE)



