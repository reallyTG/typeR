library(StatMatch)


### Name: mahalanobis.dist
### Title: Computes the Mahalanobis Distance
### Aliases: mahalanobis.dist
### Keywords: multivariate

### ** Examples


md1 <- mahalanobis.dist(iris[1:6,1:4])
md2 <- mahalanobis.dist(data.x=iris[1:6,1:4], data.y=iris[51:60, 1:4])

vv <- var(iris[,1:4])
md1a <- mahalanobis.dist(data.x=iris[1:6,1:4], vc=vv)
md2a <- mahalanobis.dist(data.x=iris[1:6,1:4], data.y=iris[51:60, 1:4], vc=vv)




