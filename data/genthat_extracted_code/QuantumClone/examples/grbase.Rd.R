library(QuantumClone)


### Name: grbase
### Title: Computes gradient of function
### Aliases: grbase

### ** Examples

fik<-matrix(c(1,0,0,1),nrow = 2)
adj.factor<-matrix(1/2,nrow =2 ,ncol =1)
centers<-c(0.25,0.75)
Alt<-c(125,375)
Depth<-c(1000,1000)
grbase(fik,adj.factor,centers,Alt,Depth)



