library(FNN)


### Name: knn.index
### Title: Search Nearest Neighbors
### Aliases: knn.index knnx.index
### Keywords: manip

### ** Examples

  data<- query<- cbind(1:10, 1:10)

  knn.index(data, k=5)
  knnx.index(data, query, k=5)
  knnx.index(data, query, k=5, algo="kd_tree")




