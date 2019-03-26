library(FNN)


### Name: get.knn
### Title: Search Nearest Neighbors
### Aliases: get.knn get.knnx
### Keywords: manip

### ** Examples

  data<- query<- cbind(1:10, 1:10)

  get.knn(data, k=5)
  get.knnx(data, query, k=5)
  get.knnx(data, query, k=5, algo="kd_tree")

  th<- runif(10, min=0, max=2*pi)
  data2<-  cbind(cos(th), sin(th))
  get.knn(data2, k=5, algo="CR")




