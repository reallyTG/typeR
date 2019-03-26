library(clusternor)


### Name: Skmeans
### Title: Perform spherical k-means clustering on a data matrix. Similar
###   to the k-means algorithm differing only in that data features are
###   min-max normalized the dissimilarity metric is Cosine distance.
### Aliases: Skmeans

### ** Examples

iris.mat <- as.matrix(iris[,1:4])
k <- length(unique(iris[, dim(iris)[2]])) # Number of unique classes
km <- Skmeans(iris.mat, k)




