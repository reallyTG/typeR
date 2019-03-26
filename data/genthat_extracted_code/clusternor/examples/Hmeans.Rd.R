library(clusternor)


### Name: Hmeans
### Title: Perform parallel hierarchical clustering on a data matrix.
### Aliases: Hmeans

### ** Examples

iris.mat <- as.matrix(iris[,1:4])
kmax <- length(unique(iris[, dim(iris)[2]])) # Number of unique classes
kms <- Hmeans(iris.mat, kmax)




