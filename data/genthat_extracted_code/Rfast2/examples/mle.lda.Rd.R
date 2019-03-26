library(Rfast2)


### Name: Maximum likelihood linear discriminant analysis
### Title: Maximum likelihood linear discriminant analysis
### Aliases: mle.lda

### ** Examples

x <- as.matrix(iris[, 1:4])
ina <- iris[, 5]
a <- mle.lda(x, x, ina)



