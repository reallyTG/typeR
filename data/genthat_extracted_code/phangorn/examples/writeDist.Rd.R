library(phangorn)


### Name: writeDist
### Title: Writing and reading distances in phylip and nexus format
### Aliases: writeDist write.nexus.dist readDist unique.dist
### Keywords: cluster

### ** Examples


data(yeast)
dm <- dist.ml(yeast)
writeDist(dm)
write.nexus.dist(dm)




