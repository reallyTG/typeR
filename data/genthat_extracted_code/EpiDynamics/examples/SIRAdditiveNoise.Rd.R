library(EpiDynamics)


### Name: SIRAdditiveNoise
### Title: SIR model with constant additive noise (P 6.1).
### Aliases: SIRAdditiveNoise

### ** Examples

# Parameters and initial conditions.
parameters <- c(beta = 1, gamma = 1 / 10, mu = 1 / (50 * 365),
                noise = 10, N = 1e6)
initials <- c(X = 1e5, Y = 500)

# Solve and plot.
sir.additive.noise <- SIRAdditiveNoise(pars = parameters, init = initials,
                                       time = 0:(2 * 365), step = 1)
PlotMods(sir.additive.noise)




