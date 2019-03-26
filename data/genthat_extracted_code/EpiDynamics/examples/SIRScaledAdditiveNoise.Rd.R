library(EpiDynamics)


### Name: SIRScaledAdditiveNoise
### Title: SIR model with Scaled additive noise (P 6.2).
### Aliases: SIRScaledAdditiveNoise

### ** Examples

# Parameters and initial conditions.
parameters <- c(beta = 1, gamma = 1 / 10, mu = 1 / (50 * 365),
                N = 1e6, step = 1)
initials <- c(X = 1e5, Y = 500)

# Solve and plot.
sir.scaled.additive.noise <- 
SIRScaledAdditiveNoise(pars = parameters, 
                       init = initials, time = 5 * 365)
PlotMods(sir.scaled.additive.noise)




