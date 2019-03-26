library(distrEx)


### Name: LMCondDistribution
### Title: Generating function for the conditional distribution of a linear
###   regression model.
### Aliases: LMCondDistribution
### Keywords: distribution models

### ** Examples

# normal error distribution
(D1 <- LMCondDistribution(theta = 1)) # corresponds to Norm(cond, 1)
plot(D1)
r(D1)
d(D1)
p(D1)
q(D1)
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
param(D1)
cond(D1)

d(D1)(0, cond = 1)
d(Norm(mean=1))(0)

E(D1, cond = 1)
E(D1, function(x){x^2}, cond = 2)
E(Norm(mean=2), function(x){x^2})



