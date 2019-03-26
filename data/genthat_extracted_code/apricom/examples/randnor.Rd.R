library(apricom)


### Name: randnor
### Title: Multivariable Random Normal data
### Aliases: randnor

### ** Examples

## Simulated data based on the iris dataset
mu <- c(rep(0, 4))
covmatr <- matrix(c(0.7, -0.04, 1.3, 0.5, -0.04, 0.2, -0.3, -0.1,
1.3, -0.3, 3.1, 1.3, 0.5, -0.1, 1.3, 0.6), ncol = 4)
sim.dat <- randnor(n = 100, mu = mu, Cov = covmatr)
head(sim.dat)




