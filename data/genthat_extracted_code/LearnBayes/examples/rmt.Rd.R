library(LearnBayes)


### Name: rmt
### Title: Random number generation for multivariate t
### Aliases: rmt
### Keywords: models

### ** Examples

mu <- c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
df <- 4
x <- rmt(10, mu, Sigma, df)



