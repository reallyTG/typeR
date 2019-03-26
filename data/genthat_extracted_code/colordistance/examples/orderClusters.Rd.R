library(colordistance)


### Name: orderClusters
### Title: Order color clusters to minimize overall color distance between
###   pairs
### Aliases: orderClusters

### ** Examples

cluster.list <- colordistance::getKMeansList(c(system.file("extdata",
"Heliconius/Heliconius_A", package="colordistance"), lower=rep(0.8, 3),
upper=rep(1, 3)))
cluster.list <- colordistance::extractClusters(cluster.list)
colordistance:::orderClusters(cluster.list)



