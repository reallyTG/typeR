library(Compositional)


### Name: Regularised discriminant analysis for compositional data using the alpha-transformation
### Title: Regularised discriminant analysis for compositional data using
###   the alpha-transformation
### Aliases: alfa.rda
### Keywords: Regularised discriminant analysis

### ** Examples

x <- as.matrix(iris[, 1:4])
x <- x / rowSums(x)
ina <- iris[, 5]
mod <- alfa.rda(x, x, ina, 0)
table(ina, mod$est)
mod2 <- alfa.rda(x, x, ina, 0.5)
table(ina, mod2$est)



