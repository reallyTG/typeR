library(esDesign)


### Name: SSR.sim
### Title: Conduct the simulation studies using SSR
### Aliases: SSR.sim

### ** Examples

N <- 310
rho <- 0.5
alpha <- 0.05
beta <- 0.2
pstar <- 0.2
theta <- c(0.2,0)
theta0 <- 0
sigma0 <- 1.0
nSim <- 1000
Seed <- 6
res <- SSR.sim(N = N, rho = rho, alpha = alpha, beta = beta, theta = theta,
        theta0 = theta0, sigma0 = sigma0, pstar = pstar,
        nSim = nSim, Seed = Seed)



