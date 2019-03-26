library(Directional)


### Name: Test for a given mean direction
### Title: Test for a given mean direction
### Aliases: meandir.test
### Keywords: One sample hypothesis test Mean direction

### ** Examples

mu <- rnorm(5)
mu <- mu / sqrt( sum(mu^2) )
x <- rvmf(100, mu, 10)
meandir.test(x, mu, 1)
meandir.test(x, mu, 499)



