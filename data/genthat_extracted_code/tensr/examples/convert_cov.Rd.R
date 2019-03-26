library(tensr)


### Name: convert_cov
### Title: Convert the output from 'equi_mcmc' to component covariance
###   matrices.
### Aliases: convert_cov
### Keywords: equivariance posterior

### ** Examples

#Generate data whose true covariance is just the identity.
p <- c(4,4,4)
X <- array(stats::rnorm(prod(p)),dim = p)
#Then run the Gibbs sampler.
mcmc_out <- equi_mcmc(X)
cov_out <- convert_cov(mcmc_out)

# Some trace plots.
plot(cov_out[[2]], type = 'l', xlab = 'Iteration',
     ylab = expression(sigma ^ 2), main = 'Trace Plot')
abline(h = 1, col = 2, lty = 2)
legend('topleft', 'True Value', col = 2, lty = 2, bty = 'n')

k <- sample(1:length(p), size = 1)
i <- sample(1:p[k], size = 1)
j <- sample(1:p[k], size = 1)
plot(cov_out[[1]][[k]][i, j, ], type = 'l', xlab = 'Iteration',
     main = 'Trace Plot',
     ylab = substitute(Sigma[k][group('[', list(i, j), ']')],
                       list(k = k, i = i, j = j)))
abline(h = 1 * (i == j), lty =  2, col = 2)
legend('topleft', 'True Value', col = 2, lty = 2, bty = 'n')



