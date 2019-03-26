library(GMCM)


### Name: SimulateGMCMData
### Title: Simulation from Gaussian mixture (copula) models
### Aliases: SimulateGMCMData SimulateGMMData

### ** Examples

set.seed(2)

# Simulation from the GMM
gmm.data1 <- SimulateGMMData(n = 200, m = 3, d = 2)
str(gmm.data1)

# Plotting the simulated data
plot(gmm.data1$z, col = gmm.data1$K)

# Simulation from the GMCM
gmcm.data1 <- SimulateGMCMData(n = 1000, m = 4, d = 2)
str(gmcm.data1)

# Plotthe 2nd simulation
par(mfrow = c(1,2))
plot(gmcm.data1$z, col = gmcm.data1$K)
plot(gmcm.data1$u, col = gmcm.data1$K)

# Simulation from the special case of GMCM
theta <- meta2full(c(0.7, 2, 1, 0.7), d = 3)
gmcm.data2 <- SimulateGMCMData(n = 5000, theta = theta)
str(gmcm.data2)

# Plotting the 3rd simulation
par(mfrow=c(1,2))
plot(gmcm.data2$z, col = gmcm.data2$K)
plot(gmcm.data2$u, col = gmcm.data2$K)



