library(rich)


### Name: shared
### Title: Computes the number of species shared by groups of sampling
###   units and other useful statistics
### Aliases: shared

### ** Examples

data(efeb)
shared(efeb)

sp1<-c(1,2,3,4,5)
sp2<-c(0,0,0,0,0)
sp3<-c(1,1,0,0,0)
sp4<-c(0,0,0,0,0)
site1<-cbind(sp1, sp2, sp3, sp4)
colnames(site1)<-c("sp1", "sp2", "sp3", "sp4")
sp1<-c(1,2,3)
sp2<-c(1,0,0)
sp3<-c(0,0,0)
sp4<-c(0,0,0)
site2<-cbind(sp1, sp2, sp3, sp4)
colnames(site2)<-c("sp1", "sp2", "sp3", "sp4")
sp1<-c(1,2,3,4)
sp2<-c(1,0,0,0)
sp3<-c(1,0,0,0)
sp4<-c(1,0,0,0)
site3<-cbind(sp1, sp2, sp3, sp4)
colnames(site3)<-c("sp1", "sp2", "sp3", "sp4")

data<-list(site1,site2, site3)
names(data)<-c("site1","site2","site3")
shared(data)


