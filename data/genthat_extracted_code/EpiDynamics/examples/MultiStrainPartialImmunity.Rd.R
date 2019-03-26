library(EpiDynamics)


### Name: MultiStrainPartialImmunity
### Title: Partial immunity model that cycles (P 4.2).
### Aliases: MultiStrainPartialImmunity

### ** Examples

# Parameters and initial conditions.
parameters <- c(beta = rep(40, 4), gamma = rep(9.98, 4),
                       mu = 0.02, a = 0.4 )

initials <- c(S = c(0.08, 0.1, 0.1, 0.11),
                       P = c(0.4, 0.3, 0.3, 0.29),
                       L = c(0.15, 0.02, 0.1, 0.01))

# Solve and plot.
mlti.strain.pi <- MultiStrainPartialImmunity(pars = parameters, 
                                             init = initials, 
                                             time = 0:200)
PlotMods(mlti.strain.pi, variables = c('L1', 'L2', 'L3', 'L4'), grid = FALSE)
                                 



