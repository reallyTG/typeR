library(BCA)


### Name: SD.clv
### Title: A Wrapper Function for the clv.SD Function and its Components
### Aliases: SD.clv
### Keywords: cluster

### ** Examples

  data(iris)
  iris.data <- iris[,1:4]
  irisC3 <- kmeans(iris.data, centers=3, nstart=10)
  SD.clv(iris.data, clus=irisC3$cluster, alpha=0.1)



