library(clusternor)


### Name: Xmeans
### Title: Perform a parallel hierarchical clustering using the x-means
###   algorithm
### Aliases: Xmeans

### ** Examples

iris.mat <- as.matrix(iris[,1:4])
kmax <- length(unique(iris[, dim(iris)[2]])) # Number of unique classes
xms <- Xmeans(iris.mat, kmax)




