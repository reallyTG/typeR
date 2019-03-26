library(EpiDynamics)


### Name: SEIR
### Title: SEIR model (2.6).
### Aliases: SEIR

### ** Examples

# Parameters and initial conditions.
parameters <- c(mu = 1 / (70 * 365), beta = 520 / 365,
                    sigma = 1 / 14, gamma = 1 / 7)
initials <- c(S = 0.1, E = 1e-04, I = 1e-04, R = 1 - 0.1 - 1e-4 - 1e-4)

# Solve and plot.
seir <- SEIR(pars = parameters, init = initials, time = 0:(60 * 365))
PlotMods(seir)



