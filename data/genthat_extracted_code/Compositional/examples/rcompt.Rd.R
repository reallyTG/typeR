library(Compositional)


### Name: Multivariate t random values simulation on the simplex
### Title: Multivariate t random values simulation on the simplex
### Aliases: rcompt
### Keywords: multivariate t distribution random values simulation

### ** Examples

x <- as.matrix(iris[, 1:2])
m <- Rfast::colmeans(x)
s <- var(x)
y <- rcompt(100, m, s, 10)
comp.den(y, dist = "t")
ternary(y)



