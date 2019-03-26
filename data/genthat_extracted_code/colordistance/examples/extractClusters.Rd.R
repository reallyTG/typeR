library(colordistance)


### Name: extractClusters
### Title: Extract cluster values and sizes from kmeans fit objects
### Aliases: extractClusters

### ** Examples

clusterList <- colordistance::getKMeansList(system.file("extdata",
"Heliconius/Heliconius_A", package="colordistance"), bins=3)

colordistance::extractClusters(clusterList)



