library(EpiDynamics)


### Name: SIS
### Title: Simple SIS model (P 2.5).
### Aliases: SIS

### ** Examples

# Parameters and initial conditions.
parameters <- c(beta = 1.4247, gamma = 0.14286)
initials <- c(S = 1 - 1e-06, I = 1e-06)

# Solve and plot.
sis <- SIS(pars = parameters, init = initials, time = 0:70)
PlotMods(sis)




