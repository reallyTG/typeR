library(EpiDynamics)


### Name: SIRSinusoidalBirth
### Title: SIR model with sinusoidal births (P 5.3).
### Aliases: SIRSinusoidalBirth

### ** Examples

                                  
# Parameters and initial conditions (bifurcation plot of infectious)
parameters <- list(beta = 17 / 13, alpha0 = 1 / (50 * 365),
                   alpha1 = 0.25, w = 2 * pi / 365 ,
                   mu = 1 / (50 * 365), gamma =  1 / 13)

parameters2 <- list(beta = 17 / 13, alpha0 = 1 / (50 * 365),
                   alpha1 = seq(0, 0.99, 0.01), w = 2 * pi / 365 ,
                   mu = 1 / (50 * 365), gamma =  1 / 13)

initials <- c(S = 1 / 17, I = 1e-4, R =  1 - (1 / 17 + 1e-4))

# Solve and plot.
sir.sinusoidal.birth <- SIRSinusoidalBirth(pars = parameters,
                                           init = initials, 
                                           time = 0:(20 * 365))
PlotMods(sir.sinusoidal.birth)

# Bifurcations
# Uncomment the following lines (running it takes more than a few seconds):
# bifurcation <- SIRSinusoidalBirth(pars = parameters2,
#                                   init = initials, 
#                                   time = 0:(20 * 365))
# PlotMods(bifur, bifur = TRUE)



