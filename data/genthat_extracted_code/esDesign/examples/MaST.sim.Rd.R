library(esDesign)


### Name: MaST.sim
### Title: Conduct the simulation studies of the Marker Sequential Test
###   design
### Aliases: MaST.sim

### ** Examples

N <- 310
rho <- 0.5
alpha <- 0.05
beta <- 0.20
theta <- c(0,0)
theta0 <- 0
sigma0 <- 1
nSim <- 1000
Seed <- 6
MaST.sim(N = N, rho = rho, alpha = alpha, beta = beta,
         theta = theta, theta0 = theta0, sigma0 = sigma0,
         nSim = nSim, Seed = Seed)



