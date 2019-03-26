library(spMC)


### Name: sim_mcs
### Title: Multinomial Categorical Simulation
### Aliases: sim_mcs
### Keywords: spatial distribution

### ** Examples
## No test: 
data(ACM)

# Model parameters estimation for the
# multinomial categorical simulation
x <- multi_tpfit(ACM$MAT5, ACM[, 1:3])

# Generate the simulation grid
mygrid <- list()
mygrid$X <- seq(min(ACM$X), max(ACM$X), length = 3)
mygrid$Y <- seq(min(ACM$Y), max(ACM$Y), length = 3)
mygrid$Z <- -40 * 0:9 - 1
mygrid <- as.matrix(expand.grid(mygrid$X, mygrid$Y, mygrid$Z))

# Simulate the random field
myMCSim <- sim_mcs(x, ACM$MAT5, ACM[, 1:3], mygrid)
## End(No test)


