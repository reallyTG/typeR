library(CUB)


### Name: simcubshe
### Title: Simulation routine for CUB models with shelter effect
### Aliases: simcubshe
### Keywords: distribution

### ** Examples

n<-300
m<-9
pai<-0.7
csi<-0.3
delta<-0.2
shelter<-3
simulation<-simcubshe(n,m,pai,csi,delta,shelter)
plot(table(simulation),xlab="Ordinal categories",ylab="Frequencies")



