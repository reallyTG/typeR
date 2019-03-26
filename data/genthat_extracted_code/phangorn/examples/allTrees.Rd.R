library(phangorn)


### Name: allTrees
### Title: Compute all trees topologies.
### Aliases: allTrees
### Keywords: cluster

### ** Examples


trees <- allTrees(5)
par(mfrow = c(3,5))
for(i in 1:15)plot(trees[[i]])




