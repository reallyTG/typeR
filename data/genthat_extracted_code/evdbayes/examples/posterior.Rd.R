library(evdbayes)


### Name: posterior
### Title: MCMC Sampling of Posterior Distributions
### Aliases: posterior
### Keywords: models

### ** Examples

mat <- diag(c(10000, 10000, 100))
pn <- prior.norm(mean = c(0,0,0), cov = mat)
## Not run: data(portpirie)
## Not run: 
##D posterior(1000, init = c(5,1,0.1), prior = pn, lh = "gev",
##D     data = portpirie, psd = c(.02,.1,.1))
## End(Not run)



