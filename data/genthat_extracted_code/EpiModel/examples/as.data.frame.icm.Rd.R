library(EpiModel)


### Name: as.data.frame.icm
### Title: Extract Model Data for Stochastic Models
### Aliases: as.data.frame.icm as.data.frame.netsim
### Keywords: extract

### ** Examples

## Stochastic ICM SIS model
param <- param.icm(inf.prob = 0.8, act.rate = 2, rec.rate = 0.1)
init <- init.icm(s.num = 500, i.num = 1)
control <- control.icm(type = "SIS", nsteps = 10,
                       nsims = 3, verbose = FALSE)
mod <- icm(param, init, control)

# Default output all simulation runs, default to all in stacked data.frame
as.data.frame(mod)
as.data.frame(mod, sim = 2)

# Time-specific means across simulations
as.data.frame(mod, out = "mean")

# Time-specific standard deviations across simulations
as.data.frame(mod, out = "sd")

# Time-specific quantile values across simulations
as.data.frame(mod, out = "qnt", qval = 0.25)
as.data.frame(mod, out = "qnt", qval = 0.75)

## Not run: 
##D ## Stochastic SI network model
##D nw <- network.initialize(n = 100, directed = FALSE)
##D formation <- ~edges
##D target.stats <- 50
##D coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)
##D est <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)
##D 
##D param <- param.net(inf.prob = 0.5)
##D init <- init.net(i.num = 10)
##D control <- control.net(type = "SI", nsteps = 10, nsims = 3, verbose = FALSE)
##D mod <- netsim(est, param, init, control)
##D 
##D # Same data extraction methods as with ICMs
##D as.data.frame(mod)
##D as.data.frame(mod, sim = 2)
##D as.data.frame(mod, out = "mean")
##D as.data.frame(mod, out = "sd")
##D as.data.frame(mod, out = "qnt", qval = 0.25)
##D as.data.frame(mod, out = "qnt", qval = 0.75)
## End(Not run)




