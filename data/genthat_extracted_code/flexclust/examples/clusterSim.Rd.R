library(flexclust)


### Name: clusterSim
### Title: Cluster Similarity Matrix
### Aliases: clusterSim clusterSim,kcca-method clusterSim,kccasimple-method
### Keywords: cluster

### ** Examples

example(Nclus)

clusterSim(cl)
clusterSim(cl, symmetric=TRUE)

## should have similar structure but will be numerically different:
clusterSim(cl, symmetric=TRUE, data=Nclus[sample(1:550, 200),])

## different concept of cluster similarity
clusterSim(cl, method="centers")



