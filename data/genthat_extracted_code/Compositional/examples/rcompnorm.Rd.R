library(Compositional)


### Name: Multivariate normal random values simulation on the simplex
### Title: Multivariate normal random values simulation on the simplex
### Aliases: rcompnorm
### Keywords: multivariate normal distribution random values simulation

### ** Examples

x <- as.matrix(iris[, 1:2])
m <- colMeans(x)
s <- var(x)
y <- rcompnorm(100, m, s)
comp.den(y)
ternary(y)



