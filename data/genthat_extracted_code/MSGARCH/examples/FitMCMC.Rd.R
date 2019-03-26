library(MSGARCH)


### Name: FitMCMC
### Title: MCMC/Bayesian estimation.
### Aliases: FitMCMC

### ** Examples

# create model specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# fit the model on the data by MCMC
set.seed(123)
fit <- FitMCMC(spec = spec, data = SMI, ctr = list(nburn = 500L, nmcmc = 500L, nthin = 1L))
summary(fit)

# custom sampler example
## Not run: 
##D library("mcmc")
##D f_MCMC <- function(f_posterior, data, spec, par0, ctr){
##D   par <- mcmc::metrop(f_posterior, initial = par0, nbatch = ctr$nmcmc + ctr$nburn,
##D                         data = data, spec = spec)$batch
##D   colnames(par) = names(par0)
##D   return(par)
##D }
##D 
##D set.seed(123)
##D fit <- FitMCMC(spec, data = SMI, ctr  = list(SamplerFUN = f_MCMC,
##D                                              nburn = 500L, nmcmc = 500L, nthin = 1L))
##D summary(fit)
## End(Not run)



