library(EpiDynamics)


### Name: sir2AgeClasses
### Title: SIR model with 2 age classes (P 3.3).
### Aliases: sir2AgeClasses

### ** Examples

# Parameters and initial conditions.
parameters <- c(betaCC = 100, betaCA = 10, betaAC = 10, betaAA = 20,
                gamma = 10, lC = 0.0666667, muC = 0.0, muA = 0.016667)
initials <- c(SC = 0.1, IC = 0.0001, SA = 0.1, IA = 0.0001)

# Solve and plot.
sir2AgeClasses <- sir2AgeClasses(pars = parameters, 
                          init = initials, time = seq(0, 100, 0.01))
PlotMods(sir2AgeClasses, variables = c('IA', 'IC'), grid = FALSE)




