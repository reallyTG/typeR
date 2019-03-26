library(bayesAB)


### Name: c.bayesTest
### Title: Concatenate bayesTest objects
### Aliases: c.bayesTest

### ** Examples

A_pois <- rpois(100, 5)
B_pois <- rpois(100, 4.7)

AB1 <- bayesTest(A_pois, B_pois, priors = c('shape' = 25, 'rate' = 5), distribution = 'poisson')
AB2 <- bayesTest(A_pois, B_pois, priors = c('shape' = 25, 'rate' = 5), distribution = 'poisson')
c(AB1, AB2)




