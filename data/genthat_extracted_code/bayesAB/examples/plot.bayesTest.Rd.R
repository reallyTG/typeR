library(bayesAB)


### Name: plot.bayesTest
### Title: Plot bayesTest objects
### Aliases: plot.bayesTest

### ** Examples

A_pois <- rpois(100, 5)
B_pois <- rpois(100, 4.7)

AB1 <- bayesTest(A_pois, B_pois, priors = c('shape' = 25, 'rate' = 5), distribution = 'poisson')

plot(AB1)
plot(AB1, percentLift = 5)

p <- plot(AB1)

p$posteriors$Lambda
## Not run: p$posteriors$Lambda + ggtitle('yolo') # modify ggplot2 object directly




