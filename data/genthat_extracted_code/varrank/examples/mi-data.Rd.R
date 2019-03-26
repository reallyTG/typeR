library(varrank)


### Name: mi.data
### Title: Empirical Estimate of the Mutual Information from a Table of
###   Counts
### Aliases: mi.data

### ** Examples

Y <- rnorm(n = 100, mean = 0, sd = 2)
X <- rnorm(n = 100, mean = 5, sd = 2)

mi.data(X = Y, Y = X, discretization.method = "sturges")



