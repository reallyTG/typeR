library(gmvarkit)


### Name: simulateGMVAR
### Title: Simulate from GMVAR process
### Aliases: simulateGMVAR

### ** Examples

# These examples use the data 'eurusd' which comes with the
# package, but in a scaled form.
data <- cbind(10*eurusd[,1], 100*eurusd[,2])
colnames(data) <- colnames(eurusd)
set.seed(1)

# GMVAR(1,2), d=2 process:
params122 <- c(0.623, -0.129, 0.959, 0.089, -0.006, 1.006, 1.746,
 0.804, 5.804, 3.245, 7.913, 0.952, -0.037, -0.019, 0.943, 6.926,
 3.982, 12.135, 0.789)
mod122 <- GMVAR(data, p=1, M=2, params=params122)
sim122 <- simulateGMVAR(mod122, nsimu=500)
plot.ts(sim122$sample)
ts.plot(sim122$mixing_weights, col=c("blue", "red"), lty=2)
plot(sim122$component, type="l")

# GMVAR(2,2), d=2 model with mean-parametrization:
params222 <- c(-11.904, 154.684, 1.314, 0.145, 0.094, 1.292, -0.389,
 -0.070, -0.109, -0.281, 0.920, -0.025, 4.839, 11.633, 124.983, 1.248,
  0.077, -0.040, 1.266, -0.272, -0.074, 0.034, -0.313, 5.855, 3.570,
  9.838, 0.740)
mod222 <- GMVAR(data, p=2, M=2, params=params222, parametrization="mean")
sim222 <- simulateGMVAR(mod222, nsimu=500)
plot.ts(sim222$sample)
ts.plot(sim222$mixing_weights, col=c("blue", "red"), lty=2)
plot(sim222$component, type="l")

# GMVAR(2,2), d=2 model with AR-parameters restricted to be
# the same for both regimes:
C_mat <- rbind(diag(2*2^2), diag(2*2^2))
params222c <- c(1.031, 2.356, 1.786, 3.000, 1.250, 0.060, 0.036,
 1.335, -0.290, -0.083, -0.047, -0.356, 0.934, -0.152, 5.201, 5.883,
 3.560, 9.799, 0.368)
mod222c <- GMVAR(data, p=2, M=2, params=params222c, constraints=C_mat)
sim222c <- simulateGMVAR(mod222c, nsimu=100,
             init_values=matrix(c(30, 30, 80, 80), nrow=2))
plot.ts(sim222c$sample)
ts.plot(sim222c$mixing_weights, col=c("blue", "red"), lty=2)
plot(sim222$component, type="l")



