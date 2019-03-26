library(flexclust)


### Name: kcca
### Title: K-Centroids Cluster Analysis
### Aliases: kcca kccaFamily flexclust-class kcca-class kccasimple-class
###   kccaFamily-class show,kccasimple-method summary,kccasimple-method
### Keywords: cluster

### ** Examples

data("Nclus")
plot(Nclus)

## try kmeans 
cl1 <- kcca(Nclus, k=4)
cl1

image(cl1)
points(Nclus)

## A barplot of the centroids 
barplot(cl1)


## now use k-medians and kmeans++ initialization, cluster centroids
## should be similar...

cl2 <- kcca(Nclus, k=4, family=kccaFamily("kmedians"),
           control=list(initcent="kmeanspp"))
cl2

## ... but the boundaries of the partitions have a different shape
image(cl2)
points(Nclus)



