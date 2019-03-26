library(basicMCMCplots)


### Name: chainsSummary
### Title: Compare summary statistics from multiple MCMC chains
### Aliases: chainsSummary

### ** Examples

samples1 <- cbind(rnorm(1000, 1), rgamma(1000, 1), rpois(1000, 1))
colnames(samples1) <- c('alpha', 'beta', 'gamma')
samples2 <- cbind(rnorm(1000, 2), rgamma(1000, 2), rpois(1000, 2))
colnames(samples2) <- c('alpha', 'beta', 'gamma')
samplesList <- list(chain1 = samples1, chain2 = samples2)
chainsSummary(samplesList, nrow = 1, jitter = .3, buffer.left = .5, buffer.right = .5)




