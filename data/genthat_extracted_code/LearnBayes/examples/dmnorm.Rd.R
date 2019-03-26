library(LearnBayes)


### Name: dmnorm
### Title: The probability density function for the multivariate normal
###   (Gaussian) probability distribution
### Aliases: dmnorm
### Keywords: models

### ** Examples

mu <- c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- c(2,14,0)
f <- dmnorm(x, mu, Sigma)



