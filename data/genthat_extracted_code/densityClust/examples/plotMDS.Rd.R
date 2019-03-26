library(densityClust)


### Name: plotMDS
### Title: Plot observations using multidimensional scaling and colour by
###   cluster
### Aliases: plotMDS

### ** Examples

irisDist <- dist(iris[,1:4])
irisClust <- densityClust(irisDist, gaussian=TRUE)
plot(irisClust) # Inspect clustering attributes to define thresholds

irisClust <- findClusters(irisClust, rho=2, delta=2)
plotMDS(irisClust)
split(iris[,5], irisClust$clusters)




