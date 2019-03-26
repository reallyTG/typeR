library(GMCM)


### Name: EMAlgorithm
### Title: EM algorithm for Gaussian mixture models
### Aliases: EMAlgorithm

### ** Examples


set.seed(10)
data <- SimulateGMCMData(n = 1000, d = 2, m = 3)
start.theta <- rtheta(d = 2, m = 3)
res <- GMCM:::EMAlgorithm(data$z, theta = start.theta)

par(mfrow = c(1,2))
plot(data$z, cex = 0.5, pch = 16, main = "Simulated data",
     col = rainbow(3)[data$K])
plot(data$z, cex = 0.5, pch = 16, main = "GMM clustering",
     col = rainbow(3)[apply(res$kappa,1,which.max)])




