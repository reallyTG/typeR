library(MSGARCH)


### Name: Risk
### Title: Value-at-Risk and Expected-shortfall.
### Aliases: Risk Risk.MSGARCH_SPEC Risk.MSGARCH_ML_FIT
###   Risk.MSGARCH_MCMC_FIT

### ** Examples

# create specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# risk from specification
par <- c(0.1, 0.1, 0.8, 0.2, 0.1, 0.8, 0.99, 0.01)
set.seed(1234)
risk <- Risk(object = spec, par = par, data = SMI, nahead = 5L)
head(risk)
plot(risk)

# risk from ML fit
fit <- FitML(spec = spec, data = SMI)
set.seed(1234)
risk <- Risk(object = fit, nahead = 5L)
head(risk)
plot(risk)

## Not run: 
##D # risk from MCMC fit
##D set.seed(1234)
##D fit <- FitMCMC(spec = spec, data = SMI)
##D risk <- Risk(object = fit, nahead = 5L)
##D head(risk)
##D plot(risk)
## End(Not run)



