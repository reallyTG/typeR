library(CUB)


### Name: probcubshe1
### Title: probcubshe1
### Aliases: probcubshe1
### Keywords: distribution

### ** Examples

m<-8
pai1<-0.5
pai2<-0.3
csi<-0.4
shelter<-6
pr<-probcubshe1(m,pai1,pai2,csi,shelter)
plot(1:m,pr,type="h",main="Extended CUB probability distribution with shelter effect",
xlab="Ordinal categories")
points(1:m,pr,pch=19)



