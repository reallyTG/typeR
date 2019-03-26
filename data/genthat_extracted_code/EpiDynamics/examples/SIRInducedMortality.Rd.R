library(EpiDynamics)


### Name: SIRInducedMortality
### Title: SIR model with disease induced mortality: Density-dependent
###   transmission (P 2.3).
### Aliases: SIRInducedMortality

### ** Examples

# Parameters and initial conditions.
parameters <- c(rho = 0.5, mu = 1 / (70 * 365), nu = 1 / (70 * 365),
                      beta = 520 / 365.0, gamma = 1 / 7)
initials <- c(X = 0.2, Y = 1e-4, Z = 0)

# Solve and plot.
# Uncomment the following lines (running it takes more than a few seconds):
# sir.induced.mortality <- SIRInducedMortality(pars = parameters, 
#                                  init = initials, 
#                                  time = 0:1e5)
# PlotMods(sir.induced.mortality)
                                 



