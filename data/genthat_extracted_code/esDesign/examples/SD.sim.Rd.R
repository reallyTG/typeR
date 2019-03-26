library(esDesign)


### Name: SD.sim
### Title: Conduct the simulation studies of the standard design
### Aliases: SD.sim

### ** Examples

N <- 620
rho <- 0.5
alpha <- 0.05
beta <- 0.2
theta <- c(0.2,0.0)
theta0 <- 0
sigma0 <- 1
nSim <- 1000
Seed <- 6
SD.sim(N = N, rho = rho,
       alpha = alpha, beta = beta, theta = theta, theta0 = theta0,
       sigma0 = sigma0, nSim = nSim, Seed = Seed)




