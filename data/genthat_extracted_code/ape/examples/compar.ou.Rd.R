library(ape)


### Name: compar.ou
### Title: Ornstein-Uhlenbeck Model for Continuous Characters
### Aliases: compar.ou
### Keywords: models

### ** Examples

data(bird.orders)
### This is likely to give you estimates close to 0, 1, and 0
### for alpha, sigma^2, and theta, respectively:
compar.ou(x <- rnorm(23), bird.orders)
### Much better with a fixed alpha:
compar.ou(x, bird.orders, alpha = 0.1)
### Let us 'mimick' the effect of different optima
### for the two clades of birds...
x <- c(rnorm(5, 0), rnorm(18, 5))
### ... the model with two optima:
compar.ou(x, bird.orders, node = 25, alpha = .1)
### ... and the model with a single optimum:
compar.ou(x, bird.orders, node = NULL, alpha = .1)
### => Compare both models with the difference in deviances
##     which follows a chi^2 with df = 1.



