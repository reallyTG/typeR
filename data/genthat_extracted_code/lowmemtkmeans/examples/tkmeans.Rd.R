library(lowmemtkmeans)


### Name: tkmeans
### Title: Trimmed k-means clustering
### Aliases: tkmeans

### ** Examples

iris_mat <- as.matrix(iris[,1:4])
scale_params<-scale_mat_inplace(iris_mat)
iris_cluster<- tkmeans(iris_mat, 2 , 0.1, c(1,1,1,1), 1, 10, 0.001) # 2 clusters



