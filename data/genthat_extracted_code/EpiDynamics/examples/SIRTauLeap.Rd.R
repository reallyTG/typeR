library(EpiDynamics)


### Name: SIRTauLeap
### Title: SIR model with tau leap method (P 6.5).
### Aliases: SIRTauLeap

### ** Examples

# Parameters and initial conditions.
parameters <- c(beta = 1, gamma = 1 / 10, mu = 5e-4, N = 50, tau = 1)
initials <- c(X = 5, Y = 1, Z = 44)
end.time <- 2 * 365

# Solve and plot.
sir.demog.stoch <- SIRTauLeap(pars = parameters, init = initials,
                              end.time = end.time)
PlotMods(sir.demog.stoch)




