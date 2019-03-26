library(bayesAB)


### Name: summary.bayesTest
### Title: Summarize bayesTest objects
### Aliases: summary.bayesTest

### ** Examples

A_pois <- rpois(100, 5)
B_pois <- rpois(100, 4.7)

AB1 <- bayesTest(A_pois, B_pois, priors = c('shape' = 25, 'rate' = 5), distribution = 'poisson')

summary(AB1)
summary(AB1, percentLift = 10, credInt = .95)




