library(miscF)


### Name: mvst.mcmc
### Title: Estimate Parameters of a Multivariate Skew t Distribution Using
###   the MCMC
### Aliases: mvst.mcmc
### Keywords: multivariate

### ** Examples

## Not run: 
##D   Mu <- rep(0, 2)
##D   Sigma <- diag(c(1,1))
##D   D <- diag(c(1,1))
##D   nu <- 5
##D   Y <- rmvst(n=1000, D, Mu, Sigma, nu)
##D   mcmc <- mvst.mcmc(Y)
## End(Not run)



