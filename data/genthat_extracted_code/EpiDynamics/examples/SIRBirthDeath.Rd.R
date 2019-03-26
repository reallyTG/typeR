library(EpiDynamics)


### Name: SIRBirthDeath
### Title: SIR model with births and deaths (P 2.2).
### Aliases: SIRBirthDeath

### ** Examples

# Parameters and initial conditions.
parameters <- c(mu = 1 / (70 * 365),
                       beta = 520 / 365, gamma = 1 / 7)
initials <- c(S = 0.1, I = 1e-4, R = 1 - 0.1 - 1e-4)

# Solve and plot.
sir.birth.death <- SIRBirthDeath(pars = parameters, init = initials, 
                                 time = 0:(60 * 365))
PlotMods(sir.birth.death)




