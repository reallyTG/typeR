library(ecodist)


### Name: pco
### Title: Principal coordinates analysis
### Aliases: pco
### Keywords: multivariate

### ** Examples

data(iris)
iris.d <- dist(iris[,1:4])
iris.pco <- pco(iris.d)

# scatterplot of the first two dimensions
plot(iris.pco$vectors[,1:2], col=as.numeric(iris$Species),
  pch=as.numeric(iris$Species), main="PCO", xlab="PCO 1", ylab="PCO 2")



