library(clusternor)


### Name: FuzzyCMeans
### Title: Perform Fuzzy C-means clustering on a data matrix. A soft
###   variant of the kmeans algorithm where each data point are assigned a
###   contribution weight to each cluster
### Aliases: FuzzyCMeans

### ** Examples

iris.mat <- as.matrix(iris[,1:4])
k <- length(unique(iris[, dim(iris)[2]])) # Number of unique classes
fcm <- FuzzyCMeans(iris.mat, k, iter.max=5)




