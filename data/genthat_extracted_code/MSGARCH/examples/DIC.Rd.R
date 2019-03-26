library(MSGARCH)


### Name: DIC
### Title: Deviance Information Criterion (DIC).
### Aliases: DIC DIC.MSGARCH_MCMC_FIT

### ** Examples

# create model specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# fit the model on data by MCMC
set.seed(123)
fit <- FitMCMC(spec = spec, data = SMI, ctr = list(nburn = 500L, nmcmc = 500L))

# compute DIC
DIC(fit)



