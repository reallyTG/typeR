library(EpiDynamics)


### Name: SIRCarrierState
### Title: SIR model with carrier state (2.7).
### Aliases: SIRCarrierState

### ** Examples

# Parameters and initial conditions.
parameters <- c(mu = 1 / (50 * 365), beta = 0.2, 
                    gamma = 0.1, Gamma = 0.001, 
                    epsilon = 0.1, rho = 0.4)
initials <- c(S = 0.1, I = 1e-4, C = 1e-3, R = 1 - 0.1 - 1e-4 - 1e-3)

# Solve the system.
sir.carrier.state <- SIRCarrierState(pars = parameters,
                                     init = initials, time = 0:60)
PlotMods(sir.carrier.state)




