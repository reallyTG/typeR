library(densityClust)


### Name: plotTSNE
### Title: Plot observations using t-distributed neighbor embedding and
###   colour by cluster
### Aliases: plotTSNE

### ** Examples

irisDist <- dist(iris[,1:4])
irisClust <- densityClust(irisDist, gaussian=TRUE)
plot(irisClust) # Inspect clustering attributes to define thresholds

irisClust <- findClusters(irisClust, rho=2, delta=2)
plotTSNE(irisClust)
split(iris[,5], irisClust$clusters)




