library(MSGARCH)


### Name: State
### Title: State probabilities.
### Aliases: State State.MSGARCH_SPEC State.MSGARCH_ML_FIT
###   State.MSGARCH_MCMC_FIT

### ** Examples

# create specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# state from specification
par <- c(0.1, 0.1, 0.8, 0.2, 0.1, 0.8, 0.99, 0.01)
state <- State(object = spec, par = par, data = SMI)
plot(state, type.prob = "filtered")

# state from ML fit
fit <- FitML(spec = spec, data = SMI)
state <- State(object = fit)
plot(state, type.prob = "smoothed")

## Not run: 
##D # state from MCMC fit
##D set.seed(1234)
##D fit <- FitMCMC(spec = spec, data = SMI)
##D state <- State(object = fit)
##D plot(state, type.prob = "smoothed")
## End(Not run)



