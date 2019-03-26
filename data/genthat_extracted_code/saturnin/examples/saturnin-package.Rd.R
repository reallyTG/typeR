library(saturnin)


### Name: saturnin-package
### Title: Spanning Trees Used for Network Inference
### Aliases: saturnin-package saturnin
### Keywords: graphical models spanning trees hyper Markov bayesian
###   inference network inference

### ** Examples

library('saturnin')
data(data_gaussian)

W <- lweights_gaussian(data_gaussian)
prob <- edge.prob(W, log = TRUE, account.prior = TRUE, q0 = 0.5)



