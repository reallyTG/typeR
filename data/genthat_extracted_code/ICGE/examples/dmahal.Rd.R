library(ICGE)


### Name: dmahal
### Title: Mahalanobis Distance
### Aliases: dmahal
### Keywords: multivariate

### ** Examples

#Generate 10 objects in dimension 2
mu <- rep(0, 2)
Sigma <- matrix(c(10,3,3,2),2,2)

x <- mvrnorm(n=10, rep(0, 2), Sigma)

d <- dmahal(x, Sigma)



