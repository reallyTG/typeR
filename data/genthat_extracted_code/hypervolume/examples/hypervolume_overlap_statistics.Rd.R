library(hypervolume)


### Name: hypervolume_overlap_statistics
### Title: Overlap statistics for set operations (Sorensen, Jaccard, etc.)
### Aliases: hypervolume_overlap_statistics

### ** Examples

## Not run: 
##D data(iris)
##D hv1 = hypervolume_gaussian(subset(iris, Species=="virginica")[,1:3])
##D hv2 = hypervolume_gaussian(subset(iris, Species=="versicolor")[,1:3])
##D hv_set <- hypervolume_set(hv1, hv2, check.memory=FALSE)
##D 
##D hypervolume_overlap_statistics(hv_set)
## End(Not run)



