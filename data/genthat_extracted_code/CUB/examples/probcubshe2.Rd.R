library(CUB)


### Name: probcubshe2
### Title: probcubshe2
### Aliases: probcubshe2
### Keywords: distribution

### ** Examples

m<-8
pai1<-0.5
pai2<-0.3
csi<-0.4
shelter<-6
delta<-1-pai1-pai2
pai<-pai1/(1-delta)
pr2<-probcubshe2(m,pai,csi,delta,shelter)
plot(1:m,pr2,type="h", main="CUB probability distribution with 
explicit shelter effect",xlab="Ordinal categories")
points(1:m,pr2,pch=19)



