library(EpiDynamics)


### Name: SIRTermTimeForcing
### Title: SIR model with corrected term-time forcing (P 5.2).
### Aliases: SIRTermTimeForcing

### ** Examples

## Parameters and initial conditions.
initials <- c(S = 1/17, I = 1e-4, R = 1 - 1/17 - 1e-4)
parameters <- list(beta0 = 17 / 13, beta1 = 0.25,
                gamma = 1 / 13, mu = 1 / (50 * 365))

## Term-times and cycles
# In a year-unit cicle, holidays happen for example
# between days 1 and 6, 101 and 115, 201 and 251,
# 301 and 307 and 308 and 365. 
# Setting low.term.first == TRUE (default) we define the
# previous term-times as low terms.
# Simulate 10 years.
terms <- c(1, 6, 100, 115, 200, 251, 300, 307, 356, 365)
cicles <- 10

# Solve and plot.
sir.term.time.forcing <- SIRTermTimeForcing(pars = parameters,
                                            init = initials,
                                            term.times = terms,
                                            cicles = 10)
PlotMods(sir.term.time.forcing)

# Solve bifurcation dynamics for 20 years.
# If the number of time-units per cicle (e.g. days) times
# the number of cicles (e.g. number of days) is less
# than 3650, bifurcation dynamics are solved for 3650
# time-steps
parameters2 <- list(beta0 = 17 / 13,
                beta1 = seq(0, 0.3, by = 0.001),
                gamma = 1 / 13, mu = 1 / (50 * 365))
# Uncomment the following lines (running it takes more than a few seconds):
# bifur <- SIRTermTimeForcing(pars = parameters2, init = initials,
#                             term.times = terms, cicles = 10)
# PlotMods(bifur, bifur = TRUE)



