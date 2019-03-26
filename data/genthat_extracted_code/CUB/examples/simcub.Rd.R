library(CUB)


### Name: simcub
### Title: Simulation routine for CUB models
### Aliases: simcub
### Keywords: distribution

### ** Examples

n<-300
m<-9
pai<-0.4
csi<-0.7
simulation<-simcub(n,m,pai,csi)
plot(table(simulation),xlab="Ordinal categories",ylab="Frequencies")



