library(mev)


### Name: gev.tem
### Title: Tangent exponential model approximation for the GEV distribution
### Aliases: gev.tem

### ** Examples

## Not run: 
##D dat <- evd::rgev(n = 40, loc = 0, scale = 2, shape = -0.1)
##D gev.tem("shape", dat = dat, plot = TRUE)
##D gev.tem("quant", dat = dat, p = 0.01, plot = TRUE)
##D gev.tem("scale", psi = seq(1, 4, by = 0.1), dat = dat, plot = TRUE)
##D dat <- evd::rgev(n = 40, loc = 0, scale = 2, shape = 0.2)
##D gev.tem("loc", dat = dat, plot = TRUE)
##D gev.tem("Nmean", dat = dat, p = 0.01, N=100, plot = TRUE)
##D gev.tem("Nquant", dat = dat, q = 0.5, N=100, plot = TRUE)
## End(Not run)



