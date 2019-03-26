library(LearnBayes)


### Name: dmt
### Title: Probability density function for multivariate t
### Aliases: dmt
### Keywords: models

### ** Examples

mu <- c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
df <- 4
x <- c(2,14,0)
f <- dmt(x, mu, Sigma, df)



