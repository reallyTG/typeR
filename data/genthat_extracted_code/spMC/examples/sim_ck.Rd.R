library(spMC)


### Name: sim_ck
### Title: Conditional Simulation Based on Indicator Cokriging
### Aliases: sim_ck
### Keywords: spatial distribution

### ** Examples
## No test: 
data(ACM)

# Model parameters estimation for the
# multinomial categorical simulation
x <- multi_tpfit(ACM$MAT5, ACM[, 1:3])

# Generate the simulation grid
mygrid <- list()
mygrid$X <- seq(min(ACM$X), max(ACM$X), length = 20)
mygrid$Y <- seq(min(ACM$Y), max(ACM$Y), length = 20)
mygrid$Z <- -40 * 0:9 - 1
mygrid <- as.matrix(expand.grid(mygrid$X, mygrid$Y, mygrid$Z))

# Simulate the random field through
# Simple Indicator Cokriging algorithm
mySCKSim <- sim_ck(x, ACM$MAT5, ACM[, 1:3], mygrid, ordinary = FALSE)

# Simulate the random field through
# Ordinary Indicator Cokriging algorithm
myOCKSim <- sim_ck(x, ACM$MAT5, ACM[, 1:3], mygrid)
## End(No test)


