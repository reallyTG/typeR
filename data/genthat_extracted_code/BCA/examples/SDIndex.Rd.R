library(BCA)


### Name: SDIndex
### Title: A Plot of SD Index Values for K-Means Clustering Solutions
### Aliases: SDIndex
### Keywords: cluster

### ** Examples

  data(iris)
  iris.data <- iris[,1:4]
  SDIndex(iris.data, minClust=2, maxClust=6, iter.max=10, num.seeds=10)



