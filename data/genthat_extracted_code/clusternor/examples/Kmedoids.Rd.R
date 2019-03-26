library(clusternor)


### Name: Kmedoids
### Title: Perform k-medoids clustering on a data matrix. After
###   initialization the k-medoids algorithm partitions data by testing
###   which data member of a cluster Ci may make a better candidate as
###   medoid (centroid) by reducing the sum of distance (usually taxi),
###   then running a reclustering step with updated medoids.
### Aliases: Kmedoids

### ** Examples

iris.mat <- as.matrix(iris[,1:4])
k <- length(unique(iris[, dim(iris)[2]])) # Number of unique classes
km <- Kmedoids(iris.mat, k)




