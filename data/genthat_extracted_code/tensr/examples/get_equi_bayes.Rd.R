library(tensr)


### Name: get_equi_bayes
### Title: Get the Bayes rule under multiway Stein's loss.
### Aliases: get_equi_bayes
### Keywords: equivariance posterior

### ** Examples

#Generate data whose true covariance is just the identity.
p <- c(4,4,4)
X <- array(stats::rnorm(prod(p)),dim = p)
#Then run the Gibbs sampler.
mcmc_out <- equi_mcmc(X)
bayes_rules <- get_equi_bayes(mcmc_out$Phi_inv, mcmc_out$sigma)
bayes_rules$Sig_hat[[1]]



