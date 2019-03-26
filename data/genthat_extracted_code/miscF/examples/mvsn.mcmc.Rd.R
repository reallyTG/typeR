library(miscF)


### Name: mvsn.mcmc
### Title: Estimate Parameters of a Multivariate Skew Normal Distribution
###   Using the MCMC
### Aliases: mvsn.mcmc
### Keywords: multivariate

### ** Examples

## Not run: 
##D   Mu <- rep(400, 2)
##D   Sigma <- diag(c(40, 40))
##D   D <- diag(c(-30, -30))
##D   Y <- rmvsn(n=1000, D, Mu, Sigma)
##D   mcmc <- mvsn.mcmc(Y)
## End(Not run)



