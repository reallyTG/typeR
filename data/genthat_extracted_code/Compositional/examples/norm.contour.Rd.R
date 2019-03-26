library(Compositional)


### Name: Contour plot of the normal distribution in S^2
### Title: Contour plot of the normal distribution in S^2
### Aliases: norm.contour
### Keywords: contour plot bivariate normal distribution

### ** Examples

x <- as.matrix(iris[, 1:3])
x <- x / rowSums(x)
norm.contour(x)
norm.contour(x, type = "ilr")



