library(Compositional)


### Name: Contour plot of the skew skew-normal distribution in S^2
### Title: Contour plot of the skew skew-normal distribution in S^2
### Aliases: skewnorm.contour
### Keywords: contour plot bivariate skew skewnormal distribution

### ** Examples

x <- as.matrix(iris[51:100, 1:3])
x <- x / rowSums(x)
skewnorm.contour(x)
skewnorm.contour(x, type = "ilr")



