library(mev)


### Name: gev.pll
### Title: Modified profile likelihood for the generalized extreme value
###   distribution
### Aliases: gev.pll

### ** Examples

## Not run: 
##D dat <- evd::rgev(n = 100, loc = 0, scale = 2, shape = 0.3)
##D gev.pll(psi = seq(-0.5,1, by=0.01), param = "shape", dat = dat)
##D gev.pll(psi = seq(-3, 3, length = 50), param = "loc", dat = dat)
##D gev.pll(psi = seq(10, 30, by = 0.1), param = "quant", dat = dat, p = 0.01)
##D gev.pll(psi = seq(12, 100, by=1), param = "Nmean", N = 100, dat = dat)
##D gev.pll(psi = seq(12, 90, by=1), param = "Nquant", N = 100, dat = dat, q = 0.5)
## End(Not run)



