library(Compositional)


### Name: Fast estimation of the value of alpha
### Title: Fast estimation of the value of alpha
### Aliases: alfa.tune
### Keywords: \alpha -transformation maximum log-likelihood estimation

### ** Examples

library(MASS)
x <- as.matrix(iris[, 1:4])
x <- x / rowSums(x)
alfa.tune(x)
alfa.profile(x)



