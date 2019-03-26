library(DescTools)


### Name: Order
### Title: Distributions of Order Statistics
### Aliases: dOrder pOrder rOrder
### Keywords: distribution

### ** Examples

dOrder(2:4, dnorm, pnorm, mean = 0.5, sd = 1.2, mlen = 5, j = 2)
dOrder(2:4, distn = "norm", mean = 0.5, sd = 1.2, mlen = 5, j = 2)
dOrder(2:4, distn = "exp", mlen = 2, j = 2)
pOrder(2:4, distn = "exp", rate = 1.2, mlen = 2, j = 2)
rOrder(5, qgamma, shape = 1, mlen = 10, j = 2)



