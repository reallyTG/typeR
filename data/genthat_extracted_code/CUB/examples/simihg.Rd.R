library(CUB)


### Name: simihg
### Title: Simulation routine for IHG models
### Aliases: simihg
### Keywords: distribution

### ** Examples

n<-300
m<-9
theta<-0.4
simulation<-simihg(n,m,theta)
plot(table(simulation),xlab="Number of categories",ylab="Frequencies")



