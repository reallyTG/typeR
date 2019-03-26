library(CUB)


### Name: betar
### Title: Beta-Binomial distribution
### Aliases: betar
### Keywords: distribution

### ** Examples

m<-9
csi<-0.8
phi<-0.2
pr<-betar(m,csi,phi)
plot(1:m,pr,type="h", main="Beta-Binomial distribution",xlab="Ordinal categories")
points(1:m,pr,pch=19)



