library(densityClust)


### Name: findClusters
### Title: Detect clusters in a densityCluster obejct
### Aliases: findClusters findClusters.densityCluster

### ** Examples

irisDist <- dist(iris[,1:4])
irisClust <- densityClust(irisDist, gaussian=TRUE)
plot(irisClust) # Inspect clustering attributes to define thresholds

irisClust <- findClusters(irisClust, rho=2, delta=2)
plotMDS(irisClust)
split(iris[,5], irisClust$clusters)




