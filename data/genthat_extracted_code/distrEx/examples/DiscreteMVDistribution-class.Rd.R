library(distrEx)


### Name: DiscreteMVDistribution-class
### Title: Discrete Multivariate Distributions
### Aliases: DiscreteMVDistribution-class
###   support,DiscreteMVDistribution-method
### Keywords: distribution

### ** Examples

(D1 <- new("MultivariateDistribution")) # Dirac measure in (0,0)
r(D1)(5)

(D2 <- DiscreteMVDistribution(supp = matrix(c(1:5, rep(3, 5)), ncol=2, byrow=TRUE)))
support(D2)
r(D2)(10)
d(D2)(support(D2))
p(D2)(lower = c(1,1), upper = c(3,3))
q(D2)
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
param(D2)
img(D2)

e1 <- E(D2) # expectation



