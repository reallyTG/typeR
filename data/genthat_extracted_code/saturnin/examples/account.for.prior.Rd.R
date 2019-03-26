library(saturnin)


### Name: account.for.prior
### Title: Accounting for prior edge appearance probability.
### Aliases: account.for.prior
### Keywords: posterior edge probability

### ** Examples

library('saturnin')
data(data_gaussian)

W <- lweights_gaussian(data_gaussian)
prob <- edge.prob(W, log = TRUE)

prob.q0 <- account.for.prior(prob, q0 = 0.5)



