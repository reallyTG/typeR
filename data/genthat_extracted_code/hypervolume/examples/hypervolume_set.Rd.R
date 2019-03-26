library(hypervolume)


### Name: hypervolume_set
### Title: Set operations (intersection / union / unique components)
### Aliases: hypervolume_set

### ** Examples

## Not run: 
##D data(iris)
##D 
##D hv1 = hypervolume_gaussian(subset(iris, Species=="setosa")[,1:3],
##D   name='setosa')
##D hv2 = hypervolume_gaussian(subset(iris, Species=="virginica")[,1:3],
##D   name='virginica')
##D hv3 = hypervolume_gaussian(subset(iris, Species=="versicolor")[,1:3],
##D   name='versicolor')
##D 
##D hv_set12 = hypervolume_set(hv1, hv2, check.memory=FALSE)
##D hv_set23 = hypervolume_set(hv2, hv3, check.memory=FALSE)
##D 
##D # no overlap found between setosa and virginica
##D hypervolume_overlap_statistics(hv_set12)
##D 
##D # some overlap found between virginica and versicolor
##D hypervolume_overlap_statistics(hv_set23)
##D # examine volumes of each set component
##D get_volume(hv_set23)
## End(Not run)



