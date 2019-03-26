library(EpiDynamics)


### Name: SEIRnStages
### Title: SEIR model with n stages (P 3.5).
### Aliases: SEIRnStages

### ** Examples

# Parameters and initial conditions.
n <- 13
parameters <- list(beta = 17 / 5, gamma = 1 / 13, mu = 1 / (55 * 365),
                   n = n, m = 8)

initials <- c(S = 0.05, I = 0.00001 * rep(1, n) / n)

# Solve and plot.
# Uncomment the following lines (running it takes more than a few seconds):
# seir.n.stages <- SEIRnStages(pars = parameters, 
#                              init = initials, 
#                              time = seq(1, 30 * 365, 1))
# PlotMods(seir.n.stages, variables = 2)
# PlotMods(seir.n.stages, variables = 3:13, grid = F)



