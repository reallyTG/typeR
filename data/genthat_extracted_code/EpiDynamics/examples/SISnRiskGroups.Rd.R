library(EpiDynamics)


### Name: SISnRiskGroups
### Title: SIS model with multiple risk groups (P 3.2).
### Aliases: SISnRiskGroups

### ** Examples

# Parameters and initial conditions.
tmp <-matrix(c(0, 3, 10, 60, 100))
beta <- 0.0016 * tmp %*% t(tmp)
parameters <- list(m = 5, beta = beta, 
                   gamma = c(0.2, 0.2, 0.2, 0.2, 0.2),
                   n = c(0.06, 0.31, 0.52, 0.08, 0.03))
initials <- c(I = c(0, 0, 0, 0, 1e-5))

# Solve and plot.
sis.n.riks.groups <- SISnRiskGroups(pars = parameters, 
                                    init = initials, 
                                    time = 0:30)
PlotMods(sis.n.riks.groups, grid = FALSE)




