library(Compositional)


### Name: Projection pursuit regression for compositional data
### Title: Projection pursuit regression for compositional data
### Aliases: comp.ppr
### Keywords: k-NN algorithm

### ** Examples

x <- as.matrix( iris[, 1:4] )
x <- x/ rowSums(x)
ina <- iris[, 5]
mod <- comp.knn(x, x, ina, a = 1, k = 5)
table(ina, mod)
mod2 <- alfa.knn(x, x, ina, a = 1, k = 5)
table(ina, mod2)




