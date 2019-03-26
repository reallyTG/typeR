library(MSGARCH)


### Name: UncVol
### Title: Unconditional volatility.
### Aliases: UncVol UncVol.MSGARCH_SPEC UncVol.MSGARCH_ML_FIT
###   UncVol.MSGARCH_MCMC_FIT

### ** Examples

# create specification
spec <- CreateSpec()

## Not run: 
##D # unconditional volatility from specification
##D par <- c(0.1, 0.1, 0.8, 0.2, 0.1, 0.8, 0.99, 0.01)
##D UncVol(object = spec, par = par)
##D 
##D # load data
##D data("SMI", package = "MSGARCH")
##D 
##D # unconditional volatility from ML fit
##D fit <- FitML(spec = spec, data = SMI)
##D UncVol(object = fit)
##D var(SMI)
##D 
##D # unconditional volatility from MCMC fit
##D set.seed(1234)
##D fit <- FitMCMC(spec = spec, data = SMI)
##D UncVol(object = fit)
## End(Not run)



