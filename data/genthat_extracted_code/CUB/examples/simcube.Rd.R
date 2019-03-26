library(CUB)


### Name: simcube
### Title: Simulation routine for CUBE models
### Aliases: simcube
### Keywords: distribution

### ** Examples

n<-300
m<-9
pai<-0.7
csi<-0.4
phi<-0.1
simulation<-simcube(n,m,pai,csi,phi)
plot(table(simulation),xlab="Ordinal categories",ylab="Frequencies")



