library(Compositional)


### Name: The k-NN algorithm for compositional data
### Title: The k-NN algorithm for compositional data
### Aliases: comp.knn alfa.knn
### Keywords: k-NN algorithm

### ** Examples

x <- as.matrix( iris[, 1:4] )
x <- x/ rowSums(x)
ina <- iris[, 5]
mod <- comp.knn(x, x, ina, a = 1, k = 5)
table(ina, mod)
mod2 <- alfa.knn(x, x, ina, a = 1, k = 5)
table(ina, mod2)




