library(Compositional)


### Name: Tuning of the k-NN algorithm for compositional data
### Title: Tuning of the he k-NN algorithm for compositional data
### Aliases: compknn.tune alfaknn.tune
### Keywords: Regularised discriminant analysis

### ** Examples

x <- as.matrix(iris[, 1:4])
x <- x/ rowSums(x)
ina <- iris[, 5]
mod1 <- compknn.tune(x, ina, a = seq(1, 1, by = 0.1) )
mod2 <- alfaknn.tune(x, ina, a = seq(-1, 1, by = 0.1) )



