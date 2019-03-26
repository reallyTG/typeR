library(hypervolume)


### Name: hypervolume_distance
### Title: Distance between two hypervolumes
### Aliases: hypervolume_distance

### ** Examples

## Not run: 
##D data(iris)
##D hv1 = hypervolume_gaussian(subset(iris, Species=="setosa")[,1:3])
##D hv2 = hypervolume_gaussian(subset(iris, Species=="virginica")[,1:3])
##D 
##D # note that minimum distance is smaller than centroid distance as expected
##D hypervolume_distance(hv1, hv2, type='centroid')
##D hypervolume_distance(hv1, hv2, type='minimum', num.points.max=500, check.memory=FALSE)
## End(Not run)



