library(ICGE)


### Name: dcor
### Title: Correlation Distance
### Aliases: dcor
### Keywords: multivariate

### ** Examples

#Generate 10 objects in dimension 8
n <- 10
mu <- sample(1:10, 8, replace=TRUE)
x <- matrix(rnorm(n*8, mean=mu, sd=1), nrow=n, byrow=TRUE)


# Correlation distances between pairs 
d <- dcor(x)



