library(colordistance)


### Name: heatmapColorDistance
### Title: Plot a heatmap of a distance matrix
### Aliases: heatmapColorDistance

### ** Examples

## Not run: 
##D # Takes a few seconds to run
##D cluster.list <- colordistance::getHistList(dir(system.file("extdata",
##D "Heliconius/", package="colordistance"), full.names=TRUE), lower=rep(0.8, 3),
##D upper=rep(1, 3))
##D 
##D CDM <- colordistance::getColorDistanceMatrix(cluster.list, plotting=FALSE)
##D 
##D colordistance::heatmapColorDistance(CDM, main="Heliconius color similarity")
##D colordistance::heatmapColorDistance(cluster.list,
##D col=colorRampPalette(c("red", "cyan", "blue"))(n=299))
## End(Not run)




