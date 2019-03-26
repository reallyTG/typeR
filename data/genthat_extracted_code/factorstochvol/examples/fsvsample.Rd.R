library(factorstochvol)


### Name: fsvsample
### Title: Markov Chain Monte Carlo (MCMC) Sampling for the Factor
###   Stochastic Volatility Model.
### Aliases: fsvsample

### ** Examples

## Not run: 
##D # Load exchange rate data (ships with stochvol):
##D data(exrates, package = "stochvol")
##D exrates$date <- NULL
##D 
##D # Compute the de-meaned percentage log returns:
##D dat <- 100 * logret(exrates, demean = TRUE)
##D 
##D # We are going to fit a one-factor model so the ordering is irrelevant
##D # NOTE that these are very few draws, you probably want more...
##D res <- fsvsample(dat, factors = 1, draws = 2000, burnin = 1000, runningstore = 6)
##D 
##D voltimeplot(res)
##D 
##D corimageplot(res, nrow(dat), plotCI = 'circle')
##D 
##D oldpar <- par(ask = TRUE)
##D plot(res)
##D par(oldpar)
## End(Not run)




