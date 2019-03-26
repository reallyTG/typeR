library(clusternor)


### Name: KmeansPP
### Title: Perform the k-means++ clustering algorithm on a data matrix.
### Aliases: KmeansPP

### ** Examples

iris.mat <- as.matrix(iris[,1:4])
k <- length(unique(iris[, dim(iris)[2]])) # Number of unique classes
nstart <- 3
km <- KmeansPP(iris.mat, k, nstart=nstart)




