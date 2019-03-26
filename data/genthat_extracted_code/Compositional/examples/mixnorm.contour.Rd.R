library(Compositional)


### Name: Contour plot of a Gaussian mixture model in S^2
### Title: Contour plot of a Gaussian mixture model in S^2
### Aliases: mixnorm.contour
### Keywords: contour plot Gaussianmixture model

### ** Examples

x <- as.matrix(iris[, 1:3])
x <- x / rowSums(x)
mod <- mix.compnorm(x, 3, model = "EII")
mixnorm.contour(x, mod)



