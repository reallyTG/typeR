library(EpiDynamics)


### Name: SIRPartialImmunity
### Title: SIR model with partial immunity (P 4.1).
### Aliases: SIRPartialImmunity

### ** Examples

# Parameters and initial conditions.
parameters <- c(mu = 1 / (70 * 365), beta1 = 260 / 365, 
                beta2 = 520 / 365, gamma1 = 1 / 7, 
                gamma2 = 1 / 7, alpha1 = 0.5,
                alpha2 = 0.4, a1 = 0.4, a2 = 0.5)

initials <- c(NSS = 0.1, NIS = 1e-4, NRS = 0.02, NRI = 0,
              NSI = 1e-4, NSR = 0.5, NIR = 0, NRR = 0.3798)

# Solve and plot.
sir.partial.immunity <- SIRPartialImmunity(pars = parameters, 
                                           init = initials,
                                           time = 0:(100 * 365))
PlotMods(sir.partial.immunity, variables = c('NIS', 'NIR'), grid = FALSE)
                                      



