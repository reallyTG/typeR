library(EpiDynamics)


### Name: SISinusoidalTransmBrith
### Title: Rabbit Hemorrhagic Disease model with sinusoidal transmission
###   rate and per capita birth rate (P 5.4).
### Aliases: SISinusoidalTransmBrith

### ** Examples

# Parameters and initial conditions.
parameters <- list(beta0 = 0.936, beta1 = 0.1, alpha0 = 0.02, alpha1 = 0.1,
                   w = 2 * pi / 365, gamma = 0.025,  mu = 0.01, m = 0.475,
                   K = 10000)
initials <- c(X = 0.5, Y = 0.01, N = 0.6)

# Solve and plot.
sis.rhdm <- SISinusoidalTransmBrith(pars = parameters,
                                    init = initials,
                                    time = 0:(60 * 365))
PlotMods(sis.rhdm)
                        



