library(CUB)


### Name: probcubshe3
### Title: probcubshe3
### Aliases: probcubshe3
### Keywords: distribution

### ** Examples

m<-8
pai1<-0.5
pai2<-0.3
csi<-0.4
shelter<-6
lambda<-pai1
eta<-1-pai2/(1-pai1)
pr3<-probcubshe3(m,lambda,eta,csi,shelter)
plot(1:m,pr3,type="h",main="CUB probability distribution with explicit 
shelter effect",xlab="Ordinal categories")
points(1:m,pr3,pch=19)



