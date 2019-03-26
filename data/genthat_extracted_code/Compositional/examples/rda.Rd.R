library(Compositional)


### Name: Regularised discriminant analysis for Euclidean data
### Title: Regularised discriminant analysis for Euclidean data
### Aliases: rda
### Keywords: Regularised discriminant analysis

### ** Examples

x <- as.matrix(iris[, 1:4])
ina <- iris[, 5]
mod <- rda(x, x, ina)
table(ina, mod$est)



