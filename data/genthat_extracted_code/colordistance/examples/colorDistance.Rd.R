library(colordistance)


### Name: colorDistance
### Title: Sum of Euclidean distances between color clusters
### Aliases: colorDistance

### ** Examples

cluster.list <- colordistance::getHistList(system.file("extdata",
"Heliconius/Heliconius_B", package="colordistance"), lower=rep(0.8, 3),
upper=rep(1, 3))
colordistance:::colorDistance(cluster.list[[1]], cluster.list[[2]])



