library(gcKrig)


### Name: FHUBdiscrete
### Title: Compute the Frechet Hoeffding Upper Bound for Given Discrete
###   Marginal Distributions
### Aliases: FHUBdiscrete
### Keywords: Correlation Structure

### ** Examples

## Not run: 
##D 
##D FHUBdiscrete(marg1 = 'nb', marg2 = 'zip',mu1 = 10, mu2 = 2, od1 = 2, od2 = 0.2)
##D FHUBdiscrete(marg1 = 'binomial', marg2 = 'zip', mu1 = 10, mu2 = 4, binomial.size1 = 25, od2 = 2)
##D FHUBdiscrete(marg1 = 'binomial', marg2 = 'poisson', mu1 = 0.3, mu2 = 20, binomial.size1 = 1)
##D 
##D NBmu = seq(0.01, 30, by = 0.02)
##D  fhub <- c()
##D  for(i in 1:length(NBmu)){
##D   fhub[i] = FHUBdiscrete(marg1 = 'nb', marg2 = 'nb',mu1 = 10, mu2 = NBmu[i], od1 = 0.2, od2 = 0.2)
##D }
##D plot(NBmu, fhub, type='l')
## End(Not run)



