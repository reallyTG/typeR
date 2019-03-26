library(RWeka)


### Name: Weka_clusterers
### Title: R/Weka Clusterers
### Aliases: Cobweb FarthestFirst SimpleKMeans XMeans DBScan
### Keywords: cluster

### ** Examples

cl1 <- SimpleKMeans(iris[, -5], Weka_control(N = 3))
cl1
table(predict(cl1), iris$Species)

## Not run: 
##D ## Requires Weka package 'XMeans' to be installed.
##D ## Use XMeans with a KDTree.
##D cl2 <- XMeans(iris[, -5],
##D               c("-L", 3, "-H", 7, "-use-kdtree",
##D                 "-K", "weka.core.neighboursearch.KDTree -P"))
##D cl2
##D table(predict(cl2), iris$Species)
## End(Not run)



