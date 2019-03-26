library(rhmc)


### Name: hmc
### Title: Hamiltonian Monte Carlo
### Aliases: hmc

### ** Examples

f = function(x) -dnorm(x, 20, 10, log = TRUE)
hmc(f, 19, 1000, 16, 0.3, 0.1)




