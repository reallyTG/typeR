library(ODEsensitivity)


### Name: ODEmorris.default
### Title: Morris Screening for General ODE Models
### Aliases: ODEmorris.default

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
# Morris screening:
set.seed(7292)
# Warning: The following code might take very long!
## No test: 
LVres_morris <- ODEmorris(mod = LVmod,
                          pars = LVpars,
                          state_init = LVinit,
                          times = LVtimes,
                          binf = LVbinf,
                          bsup = LVbsup,
                          r = 500,
                          design = list(type = "oat", 
                                        levels = 10, grid.jump = 1),
                          scale = TRUE,
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
FHNres_morris <- ODEmorris(mod = FHNmod,
                           pars = c("a", "b", "s"),
                           state_init = c(Voltage = -1, Current = 1),
                           times = seq(0.1, 50, by = 5),
                           binf = c(0.18, 0.18, 2.8),
                           bsup = c(0.22, 0.22, 3.2),
                           r = 500,
                           design = list(type = "oat", 
                                         levels = 50, grid.jump = 1),
                           scale = TRUE,
                           ode_method = "adams",
                           parallel_eval = TRUE,
                           parallel_eval_ncores = 2)
## End(No test)




