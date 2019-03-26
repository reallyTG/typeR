library(MST)


### Name: rmultime
### Title: Random Multivariate Survival Data
### Aliases: rmultime
### Keywords: Simulation Survival Multivariate Correlated

### ** Examples

randMarginalExp <- rmultime(N = 200, K = 4, beta = c(-1, 2, 2, 0, 0), cutoff = c(0.5, 0.5, 0, 0),
    digits = 1, icensor = 1, model = "marginal.multivariate.exponential", rho = .65)$dat

randFrailtyGamma <- rmultime(N = 200, K = 4, beta = c(-1, 1, 3, 0), cutoff = c(0.4, 0.6, 0),
    digits = 1, icensor = 1, model = "gamma.frailty", v = 1)$dat



