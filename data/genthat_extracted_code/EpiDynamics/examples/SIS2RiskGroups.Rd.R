library(EpiDynamics)


### Name: SIS2RiskGroups
### Title: SIS model with 2 risk groups (P 3.1).
### Aliases: SIS2RiskGroups

### ** Examples

# Parameters and initial conditions.
parameters <- c(betaHH = 10.0, betaHL = 0.1, betaLH = 0.1,
                betaLL = 1.0, gamma = 1, nH = 0.2)
initials <- c(IH = 0.00001, IL = 0.001)

# Solve and plot.
sis2risk.groups<- SIS2RiskGroups(pars = parameters,
                                 init = initials, time = 0:15)
PlotMods(sis2risk.groups, variables = c('IL', 'IH'), grid = FALSE)




