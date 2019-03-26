library(GAS)


### Name: UniGASFit
### Title: Estimate univariate GAS models
### Aliases: UniGASFit

### ** Examples

## Not run: 
##D # Specify an univariate GAS model with Student-t
##D # conditional distribution and time-varying scale.
##D library("GAS")
##D 
##D data("sp500ret")
##D 
##D GASSpec = UniGASSpec(Dist = "std", ScalingType = "Identity",
##D                      GASPar = list(location = FALSE, scale = TRUE,
##D                                    shape = FALSE))
##D 
##D Fit = UniGASFit(GASSpec, sp500ret)
##D 
##D Fit
##D 
##D # Estimate the model with a different optimizer.
##D # Assume we want to use the Nelder and Mead optimization provided by
##D # the optim() function, we create
##D # the wrapper fn.NM.optim in this way
##D 
##D fn.NM.optim <- function(par0, data, GASSpec, FUN) {
##D 
##D   optimizer = optim(par0, FUN, data = data, GASSpec = GASSpec, method = "Nelder-Mead",
##D                     control = list(trace = 0), hessian = TRUE)
##D 
##D   out = list(pars = optimizer$par,
##D              value = optimizer$value,
##D              hessian = optimizer$hessian,
##D              convergence = optimizer$convergence)
##D 
##D   return(out)
##D 
##D }
##D 
##D Fit.NM.optim = UniGASFit(GASSpec, sp500ret, fn.optimizer = fn.NM.optim )
##D 
##D Fit.NM.optim
##D 
##D 
##D # Estimate time-varying Negative Binomial distribution for the Goals dataset.
##D # Let's use the gosolnp() optimizer for the time-varying model estimation and
##D # the solnp() optimizer for estimation of the static model for the choice of
##D # the starting values. The logical is(GASSpec, "list") is TRUE when the function
##D # is evaluated for the choice of starting values, and FALSE when the function
##D # is evaluated for the time-varying model.
##D # We can also make use of parallel computation calling a cluster object defined
##D # in the Global environment.
##D 
##D library("Rsolnp")
##D fn.gosolnp <- function(par0, data, GASSpec, FUN) {
##D 
##D   if (is(GASSpec, "list")) {
##D 
##D     optimiser = suppressWarnings(solnp(par0, FUN, data = data,
##D                                        GASSpec = GASSpec,
##D                                        control = list(trace = 0)))
##D 
##D   } else {
##D 
##D     cluster = get("cluster", envir = globalenv())
##D 
##D     optimiser = suppressWarnings(gosolnp(
##D       pars = NULL,
##D       fun = FUN, data = data, cluster = cluster,
##D       GASSpec = GASSpec,
##D       n.sim = 100000,
##D       n.restarts = 10,
##D       LB = c(-5, -2, -2, -2),
##D       UB = c(5, 8, 3.0, 5.0))
##D 
##D     )
##D   }
##D 
##D   out = list(pars = optimiser$pars,
##D              value = tail(optimiser$values, 1),
##D              hessian = optimiser$hessian,
##D              convergence = optimiser$convergence)
##D 
##D   return(out)
##D 
##D }
##D 
##D data("Goals")
##D 
##D library("parallel")
##D 
##D cluster = makeCluster(2)
##D 
##D GASSpec = UniGASSpec(Dist = "negbin", ScalingType = "Inv",
##D                      GASPar = list(location = TRUE, scale = FALSE))
##D 
##D 
##D vY = na.omit(Goals[, 1])
##D 
##D Fit = UniGASFit(GASSpec, vY, fn.optimizer = fn.gosolnp)
##D 
##D Fit
##D 
##D stopCluster(cluster)
##D rm("cluster")
##D 
## End(Not run)



