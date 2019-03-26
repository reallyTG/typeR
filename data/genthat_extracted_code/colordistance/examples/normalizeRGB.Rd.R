library(colordistance)


### Name: normalizeRGB
### Title: Normalize pixel RGB ratios
### Aliases: normalizeRGB

### ** Examples

cluster.list <- colordistance::getKMeansList(c(system.file("extdata",
"Heliconius/Heliconius_A", package="colordistance"), lower=rep(0.8, 3),
upper=rep(1, 3)))
cluster.list <- colordistance::extractClusters(cluster.list)
colordistance:::normalizeRGB(cluster.list)



