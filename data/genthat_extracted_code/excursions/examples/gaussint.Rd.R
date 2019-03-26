library(excursions)


### Name: gaussint
### Title: Sequential estimation of Gaussian integrals
### Aliases: gaussint

### ** Examples

## Create mean and a tridiagonal precision matrix
n = 11
mu.x = seq(-5, 5, length=n)
Q.x = Matrix(toeplitz(c(1, -0.1, rep(0, n-2))))
## Calculate the probability that the variable is between mu-3 and mu+3
prob = gaussint(mu=mu.x, Q=Q.x, a= mu.x-3, b=mu.x+3, max.threads=2)
prob$P



