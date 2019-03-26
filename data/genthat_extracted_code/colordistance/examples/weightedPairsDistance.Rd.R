library(colordistance)


### Name: weightedPairsDistance
### Title: Distance between color clusters with user-specified color/size
###   weights
### Aliases: weightedPairsDistance

### ** Examples

cluster.list <- colordistance::getKMeansList(system.file("extdata",
"Heliconius/Heliconius_B", package="colordistance"), lower=rep(0.8, 3),
upper=rep(1, 3))
cluster.list <- colordistance::extractClusters(cluster.list, ordering=TRUE)
colordistance:::weightedPairsDistance(cluster.list[[1]], cluster.list[[2]],
size.weight=0.8, color.weight=0.2)



