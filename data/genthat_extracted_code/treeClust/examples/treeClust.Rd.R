library(treeClust)


### Name: treeClust
### Title: Build a tree-based dissimilarity for clustering, and optionally
###   perform the clustering
### Aliases: treeClust

### ** Examples

iris.km6 <- treeClust (iris[,-5], d.num = 2, final.algorithm = "kmeans", k=6)
table (iris.km6$final.clust$cluster, iris$Species)



