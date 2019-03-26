library(EpiDynamics)


### Name: SISPairwiseApprox
### Title: Pairwise SIS approximation model (P 7.8).
### Aliases: SISPairwiseApprox

### ** Examples

# Parameters and initial conditions.
n <- 4; N <- 1e4; Y <- 1; X <- N - Y
parameters <- c(tau = 0.1, gamma = 0.05, n = n, N = N)
initials <- c(X = X, Y = Y, XY = n * Y * X / N)

# Solve and plot.
sis.pairwise.approx <- SISPairwiseApprox(pars = parameters,
                                         init = initials, time = 0:100)
PlotMods(sis.pairwise.approx)




