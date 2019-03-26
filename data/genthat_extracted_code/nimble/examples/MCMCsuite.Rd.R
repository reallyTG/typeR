library(nimble)


### Name: MCMCsuite
### Title: Executes multiple MCMC algorithms and organizes results.
### Aliases: MCMCsuite

### ** Examples

## Not run: 
##D code <- nimbleCode({
##D     mu ~ dnorm(0, 1)
##D     x ~ dnorm(mu, 1)
##D })
##D output <- MCMCsuite(code,
##D                     data = list(x=3),
##D                     inits = list(mu=0),
##D                     niter = 10000,
##D                     monitors = 'mu',
##D                     MCMCs = c('nimble', 'nimble_RW'),
##D                     summaryStats = c('mean', 'sd', 'max', 'function(x) max(abs(x))'),
##D                     makePlot = FALSE)
## End(Not run)




