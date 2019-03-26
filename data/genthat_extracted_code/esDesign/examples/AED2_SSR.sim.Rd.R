library(esDesign)


### Name: AED2_SSR.sim
### Title: Conduct the simulation studies of the Adaptive Enrichment Design
###   (Strategy 2) with Sample Size Re-estimation Procedure
### Aliases: AED2_SSR.sim

### ** Examples

N <- 310
rho <- 0.5
alpha <- 0.05
beta <- 0.2
theta <- c(0,0)
theta0 <- 0
sigma0 <- 1
epsilon <- 0.5
pstar <- 0.20
nSim <- 1000
Seed <- 6
res <- AED2_SSR.sim(N1 = N, rho = rho, alpha = alpha,
             beta = beta, theta = theta, theta0 = theta0,
             sigma0 = sigma0, pstar = pstar, epsilon = epsilon,
             nSim = nSim, Seed = Seed)



