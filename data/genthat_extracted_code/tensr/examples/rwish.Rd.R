library(tensr)


### Name: rwish
### Title: Wishart simulation.
### Aliases: rwish
### Keywords: multivariate simulation

### ** Examples

# simulate several matrices and compute the mean.
SS <- matrix(0, 5, 5)
for(s in 1:1000) { SS <- SS + tensr:::rwish(diag(5), 3) }
SS / s



