library(EpiDynamics)


### Name: SIR2TypesImports
### Title: SIR model with two types of imports (P 6.6).
### Aliases: SIR2TypesImports

### ** Examples

# Parameters and initial conditions.
parameters <- c(beta = 1, gamma = 0.1, mu = 5e-4,
                epsilon = 2e-5, delta = 0.01)
initials <- c(X = 5, Y = 2, N = 50)

# Solve and plot.
sir.2types.imports <- SIR2TypesImports(parameters, initials, 2 * 365)
PlotMods(sir.2types.imports)




