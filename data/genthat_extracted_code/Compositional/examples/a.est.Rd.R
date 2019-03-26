library(Compositional)


### Name: Estimation of the value of alpha in the folded model
### Title: Estimation of the value of alpha in the folded model
### Aliases: a.est
### Keywords: \alpha -transformation maximum likelihood estimation

### ** Examples

x <- as.matrix(iris[, 1:4])
x <- x / rowSums(x)
alfa.tune(x)
a.est(x)



