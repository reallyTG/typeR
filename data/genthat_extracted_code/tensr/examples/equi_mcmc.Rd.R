library(tensr)


### Name: equi_mcmc
### Title: Gibbs sampler using an invariant prior.
### Aliases: equi_mcmc
### Keywords: equivariance

### ** Examples

#Generate data whose true covariance is just the identity.
p <- c(2,2,2)
X <- array(stats::rnorm(prod(p)),dim = p)
#Then run the Gibbs sampler.
mcmc_out <- equi_mcmc(X)
plot(mcmc_out$sigma, type = 'l', lwd = 2, ylab = expression(sigma),
     xlab = 'Iteration', main = 'Trace Plot')
abline(h = 1,col = 2,lty = 2)



