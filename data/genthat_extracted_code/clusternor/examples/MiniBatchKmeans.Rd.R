library(clusternor)


### Name: MiniBatchKmeans
### Title: A randomized dataset sub-sample algorithm that approximates the
###   k-means algorithm. See:
###   https://www.eecs.tufts.edu/~dsculley/papers/fastkmeans.pdf
### Aliases: MiniBatchKmeans

### ** Examples

iris.mat <- as.matrix(iris[,1:4])
k <- length(unique(iris[, dim(iris)[2]])) # Number of unique classes
kms <- MiniBatchKmeans(iris.mat, k, batch.size=5)




