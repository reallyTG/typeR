library(EpiDynamics)


### Name: SIRVector
### Title: SIR model for mosquito vectors (P 4.4).
### Aliases: SIRVector

### ** Examples

# Parameters and initial conditions.
parameters <- c(muH = 5.5e-5, muM = 0.143,
                vH = 5.5e-2, vM = 1.443e3, 
                betaHM = 0.5, betaMH = 0.8, 
                gamma = 0.033, r = 0.5 / 1e3)

initials <- c(XH = 1e3, XM = 1e4, YH = 1, YM = 1)

# Solve and plot.
sir.vector <- SIRVector(pars = parameters,
                        init = initials,
                        time = 0:1000)                                 
PlotMods(sir.vector)




