library(saturnin)


### Name: edge.prob
### Title: Computation of posterior edge appearance probabilities in a
###   random tree.
### Aliases: edge.prob
### Keywords: posterior edge probability

### ** Examples

library('saturnin')
data(data_gaussian)

W <- lweights_gaussian(data_gaussian)
prob <- edge.prob(W, log = TRUE, account.prior = TRUE, q0 = 0.5)



