library(LearnBayes)


### Name: rmnorm
### Title: Random number generation for multivariate normal
### Aliases: rmnorm
### Keywords: models

### ** Examples

mu <- c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10, mu, Sigma)



