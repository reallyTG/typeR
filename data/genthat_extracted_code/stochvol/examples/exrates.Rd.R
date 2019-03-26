library(stochvol)


### Name: exrates
### Title: Euro exchange rate data
### Aliases: exrates
### Keywords: datasets

### ** Examples

## Not run: 
##D data(exrates)
##D dat <- logret(exrates$USD, demean = TRUE)  ## de-meaned log-returns
##D res <- svsample(dat)                       ## run MCMC sampler
##D plot(res, forecast = 100)                  ## display results
## End(Not run)



