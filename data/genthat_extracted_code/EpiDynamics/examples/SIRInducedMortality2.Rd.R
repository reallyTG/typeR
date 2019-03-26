library(EpiDynamics)


### Name: SIRInducedMortality2
### Title: SIR model with disease induced mortality: frequency-dependent
###   transmission (P 2.4).
### Aliases: SIRInducedMortality2

### ** Examples

# Parameters and initial conditions.
parameters<- c(rho = 0.5,mu = 1 / (70 * 365.0),nu= 1 / (70 * 365.0),
                      beta = 520 / 365.0, gamma = 1 / 7)
initials <- c(X = 0.2, Y = 1e-4, Z = 0)

# Solve and plot.
sir.induced.mortality2 <- SIRInducedMortality2(pars = parameters, 
                                 init = initials, 
                                 time = 0:1e4)
PlotMods(sir.induced.mortality2)



