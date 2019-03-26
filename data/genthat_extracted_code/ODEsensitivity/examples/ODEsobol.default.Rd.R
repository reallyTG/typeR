library(ODEsensitivity)


### Name: ODEsobol.default
### Title: Sobol' Sensitivity Analysis for General ODE Models
### Aliases: ODEsobol.default

### ** Examples

##### Lotka-Volterra equations #####
# The model function:
LVmod <- function(Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    Ingestion    <- rIng  * Prey * Predator
    GrowthPrey   <- rGrow * Prey * (1 - Prey/K)
    MortPredator <- rMort * Predator
    
    dPrey        <- GrowthPrey - Ingestion
    dPredator    <- Ingestion * assEff - MortPredator
    
    return(list(c(dPrey, dPredator)))
  })
}
# The parameters to be included in the sensitivity analysis and their lower 
# and upper boundaries:
LVpars  <- c("rIng", "rGrow", "rMort", "assEff", "K")
LVbinf <- c(0.05, 0.05, 0.05, 0.05, 1)
LVbsup <- c(1.00, 3.00, 0.95, 0.95, 20)
# The initial values of the state variables:
LVinit  <- c(Prey = 1, Predator = 2)
# The timepoints of interest:
LVtimes <- c(0.01, seq(1, 50, by = 1))
set.seed(59281)
# Sobol' sensitivity analysis (here only with n = 500, but n = 1000 is
# recommended):
# Warning: The following code might take very long!
## No test: 
LVres_sobol <- ODEsobol(mod = LVmod,
                        pars = LVpars,
                        state_init = LVinit,
                        times = LVtimes,
                        n = 500,
                        rfuncs = "runif",
                        rargs = paste0("min = ", LVbinf,
                                       ", max = ", LVbsup),
                        sobol_method = "Martinez",
                        ode_method = "lsoda",
                        parallel_eval = TRUE,
                        parallel_eval_ncores = 2)
## End(No test)

##### FitzHugh-Nagumo equations (Ramsay et al., 2007) #####
FHNmod <- function(Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    
    dVoltage <- s * (Voltage - Voltage^3 / 3 + Current)
    dCurrent <- - 1 / s *(Voltage - a + b * Current)
    
    return(list(c(dVoltage, dCurrent)))
  })
}
# Warning: The following code might take very long!
## No test: 
FHNres_sobol <- ODEsobol(mod = FHNmod,
                         pars = c("a", "b", "s"),
                         state_init = c(Voltage = -1, Current = 1),
                         times = seq(0.1, 50, by = 5),
                         n = 500,
                         rfuncs = "runif",
                         rargs = c(rep("min = 0.18, max = 0.22", 2),
                                   "min = 2.8, max = 3.2"),
                         sobol_method = "Martinez",
                         ode_method = "adams",
                         parallel_eval = TRUE,
                         parallel_eval_ncores = 2)
## End(No test)
# Just for demonstration purposes: The use of different distributions for the 
# parameters (here, the distributions and their arguments are chosen 
# completely arbitrarily):
# Warning: The following code might take very long!
## No test: 
demo_dists <- ODEsobol(mod = FHNmod,
                       pars = c("a", "b", "s"),
                       state_init = c(Voltage = -1, Current = 1),
                       times = seq(0.1, 50, by = 5),
                       n = 500,
                       rfuncs = c("runif", "rnorm", "rexp"),
                       rargs = c("min = 0.18, max = 0.22",
                                 "mean = 0.2, sd = 0.2 / 3",
                                 "rate = 1 / 3"),
                       sobol_method = "Martinez",
                       ode_method = "adams",
                       parallel_eval = TRUE,
                       parallel_eval_ncores = 2)
## End(No test)




