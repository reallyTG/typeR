library(EpiDynamics)


### Name: SISDemogStoch
### Title: SIS model with demographic stochasticity (P 6.3).
### Aliases: SISDemogStoch

### ** Examples

# Parameters and initial conditions.
parameters <- c(beta = 0.03, gamma = 1 / 100, N = 100)
initials <- 70

# Solve and plot.
sis.demog.stoch <- SISDemogStoch(pars = parameters,
                                 init = initials, end.time = 10 * 365)
PlotMods(sis.demog.stoch)




