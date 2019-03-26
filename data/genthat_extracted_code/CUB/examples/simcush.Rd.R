library(CUB)


### Name: simcush
### Title: Simulation routine for CUSH models
### Aliases: simcush
### Keywords: distribution

### ** Examples

n<-200
m<-7
delta<-0.3
shelter<-3
simulation<-simcush(n,m,delta,shelter)
plot(table(simulation),xlab="Ordinal categories",ylab="Frequencies")



