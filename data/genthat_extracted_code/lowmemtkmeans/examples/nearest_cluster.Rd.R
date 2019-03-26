library(lowmemtkmeans)


### Name: nearest_cluster
### Title: Allocates each rw (observation) in data to the nearest cluster
###   centre.
### Aliases: nearest_cluster

### ** Examples

iris_mat <- as.matrix(iris[,1:4])
centres<- tkmeans(iris_mat, 3 , 0.2, c(1,1,1,1), 1, 10, 0.001)
nearest_cluster(iris_mat, centres)



