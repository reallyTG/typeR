library(spMC)


### Name: sim_path
### Title: Conditional Simulation Based on Path Algorithms
### Aliases: sim_path
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
# the fixed path algorithm
myFixPathSim <- sim_path(x, ACM$MAT5, ACM[, 1:3], mygrid,
                         radius = 50, fixed = TRUE)

# Simulate the random field through
# the random path algorithm
myRndPathSim <- sim_path(x, ACM$MAT5, ACM[, 1:3], mygrid, radius = 50)
## End(No test)


