library(LaplacesDemon)


### Name: dist.Zellner
### Title: Hyperprior-g Prior and Zellner's g-Prior
### Aliases: dhyperg dzellner rzellner
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
beta <- rnorm(10)
g <- 100
sigma <- 2
X <- cbind(1,matrix(rnorm(100*9),100,9))
dhyperg(g, alpha=3)
dzellner(beta, g, sigma, X)
rzellner(1, g, sigma, X)



