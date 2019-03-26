library(clusterSim)


### Name: dist.Symbolic
### Title: Calculates distance between interval-valued symbolic data
### Aliases: dist.Symbolic
### Keywords: interval-valued data symbolic data analysis distances for
###   interval-valued data

### ** Examples

library(clusterSim)
dataSymbolic<-cluster.Gen(numObjects=10,model=5,dataType="s")$data
print(dist.Symbolic(dataSymbolic))



