library(hypervolume)


### Name: hypervolume_threshold
### Title: Thresholds hypervolume and calculates volume quantile statistics
###   (empirical cumulative distribution function)
### Aliases: hypervolume_threshold

### ** Examples

## Not run: 
##D data(iris)
##D hv = hypervolume_gaussian(data=subset(iris, Species=="setosa")[,1:3],name='setosa')
##D 
##D # get hypervolumes at multiple thresholds
##D hvlist = hypervolume_threshold(hv, plot=TRUE)
##D head(hvlist$Statistics)
##D plot(hvlist$HypervolumesThresholded[[c(1,5,10,15,20)]],
##D   show.random=FALSE, show.data=FALSE,show.centroid=FALSE)
##D 
##D # get hypervolume for a single low quantile value
##D plot(hypervolume_threshold(hv, plot=FALSE, verbose=FALSE,
##D   quantile.requested=0.2,quantile.requested.type="volume")[[1]])
## End(Not run)



