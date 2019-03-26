library(evmix)


### Name: mgamma
### Title: Mixture of Gammas Distribution
### Aliases: mgamma dmgamma pmgamma qmgamma rmgamma dmgamma mgamma pmgamma
###   qmgamma rmgamma pmgamma mgamma dmgamma qmgamma rmgamma qmgamma mgamma
###   dmgamma pmgamma rmgamma rmgamma mgamma dmgamma pmgamma qmgamma

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D n = 1000
##D x = rmgamma(n, mgshape = c(1, 6), mgscale = c(1,2), mgweight = c(1, 2))
##D xx = seq(-1, 40, 0.01)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 40))
##D lines(xx, dmgamma(xx, mgshape = c(1, 6), mgscale = c(1, 2), mgweight = c(1, 2)))
##D 
##D # By direct simulation
##D n1 = rbinom(1, n, 1/3) # sample size from population 1
##D x = c(rgamma(n1, shape = 1, scale = 1), rgamma(n - n1, shape = 6, scale = 2))
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 40))
##D lines(xx, dmgamma(xx, mgshape = c(1, 6), mgscale = c(1, 2), mgweight = c(1, 2)))
## End(Not run)




