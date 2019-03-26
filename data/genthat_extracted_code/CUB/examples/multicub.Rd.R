library(CUB)


### Name: multicub
### Title: Joint plot of estimated CUB models in the parameter space
### Aliases: multicub
### Keywords: device

### ** Examples

data(univer)
listord<-univer[,8:12]
multicub(listord,colours=rep("red",5),cex=c(0.4,0.6,0.8,1,1.2),
  pch=c(1,2,3,4,5),xlim=c(0,0.4),ylim=c(0.75,1),pos=c(1,3,3,3,3))
###############################
m1<-5; m2<-7;  m3<-9
pai<-0.7;csi<-0.6
n1<-1000; n2<-500; n3<-1500
ord1<-simcub(n1,m1,pai,csi)
ord2<-simcub(n2,m2,pai,csi)
ord3<-simcub(n3,m3,pai,csi)
listord<-list(ord1,ord2,ord3)
multicub(listord,labels=c("m=5","m=7","m=9"),pos=c(3,1,4))



