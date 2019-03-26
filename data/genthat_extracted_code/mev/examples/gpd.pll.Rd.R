library(mev)


### Name: gpd.pll
### Title: Modified profile likelihood for the generalized Pareto
###   distribution
### Aliases: gpd.pll

### ** Examples

## Not run: 
##D dat <- evd::rgpd(n = 100, scale = 2, shape = 0.3)
##D gpd.pll(psi = seq(-0.5, 1, by=0.01), param = "shape", dat = dat)
##D gpd.pll(psi = seq(0.1, 5, by=0.1), param = "scale", dat = dat)
##D gpd.pll(psi = seq(20, 35, by=0.1), param = "quant", dat = dat, p = 0.01)
##D gpd.pll(psi = seq(20, 80, by=0.1), param = "ES", dat = dat, m = 100)
##D gpd.pll(psi = seq(15, 100, by=1), param = "Nmean", N = 100, dat = dat)
##D gpd.pll(psi = seq(15, 90, by=1), param = "Nquant", N = 100, dat = dat, q = 0.5)
## End(Not run)



