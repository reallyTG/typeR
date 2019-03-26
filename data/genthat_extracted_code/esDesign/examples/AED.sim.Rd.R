library(esDesign)


### Name: AED.sim
### Title: Conduct the simulation studies of the Adaptive Enrichment Design
###   without early stopping boundary
### Aliases: AED.sim

### ** Examples

N1 <- 310
N2 <- 310
rho <- 0.5
alpha <- 0.05
beta <- 0.20
theta <- c(0,0)
theta0 <- 0
K <- 2
Info <- 0.5
epsilon <- 0.5
sigma0 <- 1
nSim <- 1000
Seed <- 6
AED.sim(N1 = N1, N2 = N2, rho = rho, alpha = alpha,
        beta = beta, theta = theta, theta0 = theta0,
        K  = K, Info = Info, epsilon = epsilon,
        sigma0 = sigma0, nSim = nSim, Seed = Seed)



