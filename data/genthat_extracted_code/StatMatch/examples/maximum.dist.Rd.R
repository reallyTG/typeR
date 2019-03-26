library(StatMatch)


### Name: maximum.dist
### Title: Computes the Maximum Distance
### Aliases: maximum.dist
### Keywords: multivariate

### ** Examples


md1 <- maximum.dist(iris[1:10,1:4])
md2 <- maximum.dist(iris[1:10,1:4], rank=TRUE)

md3 <- maximum.dist(data.x=iris[1:50,1:4], data.y=iris[51:100,1:4])
md4 <- maximum.dist(data.x=iris[1:50,1:4], data.y=iris[51:100,1:4], rank=TRUE)




