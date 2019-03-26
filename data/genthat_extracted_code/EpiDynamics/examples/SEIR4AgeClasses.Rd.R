library(EpiDynamics)


### Name: SEIR4AgeClasses
### Title: SEIR model with 4 age classes and yearly aging (P 3.4).
### Aliases: SEIR4AgeClasses

### ** Examples

# Parameters and initial conditions.
parameters <- list(beta = matrix(c(2.089, 2.089, 2.086, 2.037,
                                   2.089, 9.336, 2.086, 2.037,
                                   2.086, 2.086, 2.086, 2.037,
                                   2.037, 2.037, 2.037, 2.037),
                                 nrow = 4, ncol = 4),
                    sigma = 0.125, gamma = 0.2,
                    mu = c(0, 0, 0, 1) / (55 * 365),
                    nu = c(1 / (55 * 365), 0, 0, 0),
                    n = c(6, 4, 10, 55) / 75)
                          
initials <- c(S = c(0.05, 0.01, 0.01, 0.008), 
              E = c(0.0001, 0.0001, 0.0001, 0.0001),
              I = c(0.0001, 0.0001, 0.0001, 0.0001),
              R = c(0.0298, 0.04313333, 0.12313333, 0.72513333))

# Solve and plot.
# Uncomment the following lines (running it takes more than a few seconds):
# seir4.age.classes <- SEIR4AgeClasses(pars = parameters, 
#                                      init = initials,
#                                      time = 0:36500)
# PlotMods(seir4.age.classes,
#          variables = c('I1', 'I2', 'I3', 'I4'), grid = F)




