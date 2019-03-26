library(GMCM)


### Name: choose.theta
### Title: Heuristically chosen starting value of theta
### Aliases: choose.theta

### ** Examples

set.seed(2)

# Simulating data
data1 <- SimulateGMCMData(n = 10000, m = 3, d = 2)
obs.data <- Uhat(data1$u)  # The ranked observed data

# Using choose.theta to get starting estimates
theta <- choose.theta(u = obs.data, m = 3)
print(theta)

# To illustrate theta, we can simulate from the model
data2 <- SimulateGMMData(n = 10000, theta = theta)

cols <- apply(get.prob(obs.data,theta),1,which.max)

# Plotting
par(mfrow = c(1,3))
plot(data1$z, main = "True latent GMM")
plot(Uhat(data1$u), col = cols,
     main = "Observed GMCM\nColoured by k-means clustering")
plot(data2$z, main = "initial GMM")

# Alteratively, theta can simply be plotted to illustrate the GMM density
dev.off()
plot(theta, add.ellipses = TRUE)
points(data2$z, pch = 16, cex = 0.4)



