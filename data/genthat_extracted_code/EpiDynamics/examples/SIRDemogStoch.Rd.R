library(EpiDynamics)


### Name: SIRDemogStoch
### Title: SIR model with demographic stochasticity (P 6.4).
### Aliases: SIRDemogStoch

### ** Examples

# Parameters and initial conditions.
parameters <- c(beta = 1, gamma = 1 / 10, mu = 5e-4)
initials <- c(X = 500, Y = 25, N = 5e3)

# Solve and plot.
sir.demog.stoch <- SIRDemogStoch(pars = parameters, 
                                 init = initials, time = 2 * 365)
PlotMods(sir.demog.stoch)




