library(MSGARCH)


### Name: Volatility
### Title: Volatility filtering.
### Aliases: Volatility Volatility.MSGARCH_SPEC Volatility.MSGARCH_ML_FIT
###   Volatility.MSGARCH_MCMC_FIT

### ** Examples

# create specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# in-sample volatility from specification
par <- c(0.1, 0.1, 0.8, 0.2, 0.1, 0.8, 0.99, 0.01)
vol <- Volatility(object = spec, par = par, data = SMI)
head(vol)
plot(vol)

# in-sample volatility from ML fit
fit <- FitML(spec = spec, data = SMI)
vol <- Volatility(object = fit)
head(vol)
plot(vol)

## Not run: 
##D # in-sample volatility from MCMC fit
##D set.seed(1234)
##D fit <- FitMCMC(spec = spec, data = SMI)
##D vol <- Volatility(object = fit)
##D head(vol)
##D plot(vol)
## End(Not run)



