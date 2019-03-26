library(clusternor)


### Name: Kmeans
### Title: Perform k-means clustering on a data matrix.
### Aliases: Kmeans

### ** Examples

iris.mat <- as.matrix(iris[,1:4])
k <- length(unique(iris[, dim(iris)[2]])) # Number of unique classes
kms <- Kmeans(iris.mat, k)




