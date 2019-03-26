library(GMCM)


### Name: get.IDR
### Title: Posterior class probabilities, local, and adjusted IDRs.
### Aliases: get.IDR get.prob get.idr

### ** Examples

set.seed(1123)

# True parameters
true.par <- c(0.9, 2, 0.7, 0.6)

# Simulation of data from the GMCM model
data <-  SimulateGMCMData(n = 1000, par = true.par, d = 2)

# Initial parameters
init.par <- c(0.5, 1, 0.5, 0.9)

# Nelder-Mead optimization
nm.par   <- fit.meta.GMCM(data$u, init.par = init.par, method = "NM")

# Get IDR values
res <- get.IDR(data$u, nm.par, threshold = 0.05)

# Plot results
plot(data$u, col = res$Khat, pch = c(3,16)[data$K])



