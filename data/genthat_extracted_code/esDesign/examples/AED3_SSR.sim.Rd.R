library(esDesign)


### Name: AED3_SSR.sim
### Title: Conduct the simulation studies of the Adaptive Enrichment Design
###   (Strategy 3) with Sample Size Re-estimation Procedure based on
###   Futility and Efficacy Stopping Boundaries for the continuous endpoint
### Aliases: AED3_SSR.sim

### ** Examples

N <- 310
rho <- 0.5
alpha <- 0.05
beta <- 0.2
theta <- c(0,0)
theta0 <- 0
sigma0 <- 1
pstar <- 0.20
nSim <- 100
Seed <- 6
res <- AED3_SSR.sim(N1 = N, rho = rho, alpha = alpha,
             beta = beta, theta = theta, theta0 = theta0,
             sigma0 = sigma0, pstar = pstar, nSim = nSim,
             Seed = Seed)



