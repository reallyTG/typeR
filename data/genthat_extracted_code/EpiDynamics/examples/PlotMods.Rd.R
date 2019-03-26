library(EpiDynamics)


### Name: PlotMods
### Title: Plot results of capm model functions
### Aliases: PlotMods

### ** Examples

# Parameters and initial conditions.
parameters <- list(beta0 = 17 / 13, beta1 = 0.1, gamma = 1 / 13,
                   omega = 2 * pi / 365, mu = 1 / (50 * 365))

initials <- c(S = 1 / 17, I = 1e-4, 
              R = 1 - 1 / 17 - 1e-4)

# Solve the system.
sir.sinusoidal.forcing <- SIRSinusoidalForcing(pars = parameters, 
                                               init = initials, 
                                               time = 0:(60 * 365))
PlotMods(sir.sinusoidal.forcing)                                          
                                               
# Solve bifurcation dynamics for 20 years.
# If max(time) < 3650, bifurcation dynamics are solved for 3650 time-steps.
parameters2 <- list(beta0 = 17 / 13, beta1 = seq(0.001, 0.251, by = 0.001),
                   gamma = 1 / 13, omega = 2 * pi / 365, mu = 1 / (50 * 365))
# Uncomment the following lines:
# bifur <- SIRSinusoidalForcing(pars = parameters2, 
#                               init = initials,
#                               time = 0:(20 * 365))
# PlotMods(bifur, bifur = TRUE)




