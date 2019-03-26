library(Compositional)


### Name: Hotelling's multivariate version of the 1 sample t-test for Euclidean data
### Title: Hotelling's multivariate version of the 1 sample t-test for
###   Euclidean data
### Aliases: hotel1T2
### Keywords: Hypothesis test mean vector

### ** Examples

x <- Rfast::rmvnorm(100, numeric(10), diag( rexp(10,0.5) ) )
hotel1T2(x, numeric(10), R = 1)
hotel1T2(x, numeric(10), R = 999, graph = TRUE)



