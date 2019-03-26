library(spMC)


### Name: quench
### Title: Conditional Simulation Adjuster Via Quenching Algorithm
### Aliases: quench
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
# Ordinary Indicator Kriging algorithm
myOIKSim <- sim_ik(x, ACM$MAT5, ACM[, 1:3], mygrid)
 
# Perform the quenching algorithm 
# to adjust simulation
quench(x, ACM$MAT5, ACM[, 1:3], myOIKSim, optype = "coordprobs",
       max.it = 2, knn = 12) 
## End(No test)


