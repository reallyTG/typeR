library(densityClust)


### Name: densityClust
### Title: Calculate clustering attributes based on the densityClust
###   algorithm
### Aliases: densityClust

### ** Examples

irisDist <- dist(iris[,1:4])
irisClust <- densityClust(irisDist, gaussian=TRUE)
plot(irisClust) # Inspect clustering attributes to define thresholds

irisClust <- findClusters(irisClust, rho=2, delta=2)
plotMDS(irisClust)
split(iris[,5], irisClust$clusters)




