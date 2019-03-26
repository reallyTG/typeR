library(MSGARCH)


### Name: simulate.MSGARCH_SPEC
### Title: Simulation of MSGARCH processes.
### Aliases: simulate.MSGARCH_SPEC simulate.MSGARCH_ML_FIT
###   simulate.MSGARCH_MCMC_FIT

### ** Examples

# create specification
spec <- CreateSpec()

# simulation from specification
par <- c(0.1, 0.1, 0.8, 0.2, 0.1, 0.8, 0.99, 0.01)
set.seed(1234)
sim <- simulate(object = spec, nsim = 1L, nahead = 1000L, 
                nburnin = 500L, par = par)
head(sim)
plot(sim)

# load data
data("SMI", package = "MSGARCH")

# simulation from ML fit
fit <- FitML(spec = spec, data = SMI)
set.seed(1234)
sim <- simulate(object = fit, nsim = 1L, nahead = 1000L, 
                nburnin = 500L)
head(sim)
plot(sim)

## Not run: 
##D # simulation from MCMC fit
##D fit <- FitMCMC(spec = spec, data = SMI)
##D set.seed(1234)
##D sim <- simulate(object = fit, nahead = 100L, nburnin = 500L)
##D head(sim)
##D plot(sim)
## End(Not run)



