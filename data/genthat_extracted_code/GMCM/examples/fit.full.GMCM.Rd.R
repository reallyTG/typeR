library(GMCM)


### Name: fit.full.GMCM
### Title: Estimate GMCM parameters of the general model
### Aliases: fit.full.GMCM fit.full.gmcm

### ** Examples

set.seed(17)
sim <- SimulateGMCMData(n = 1000, m = 3, d = 2)

# Plotting simulated data
par(mfrow = c(1,2))
plot(sim$z, col = rainbow(3)[sim$K], main = "Latent process")
plot(sim$u, col = rainbow(3)[sim$K], main = "GMCM process")

# Observed data
uhat <- Uhat(sim$u)

# The model should be fitted multiple times using different starting estimates
start.theta <- choose.theta(uhat, m = 3)  # Random starting estimate
res <- fit.full.GMCM(u = uhat, theta = start.theta,
                     method = "NM", max.ite = 3000,
                     reltol = 1e-2, trace = TRUE)  # Note, 1e-2 is too big

# Confusion matrix
Khat <- apply(get.prob(uhat, theta = res), 1, which.max)
table("Khat" = Khat, "K" = sim$K)  # Note, some components have been swapped

# Simulation from GMCM with the fitted parameters
simfit <- SimulateGMCMData(n = 1000, theta = res)

# As seen, the underlying latent process is hard to estimate.
# The clustering, however, is very good.
par(mfrow = c(2,2))
plot(simfit$z, col = simfit$K, main = "Model check 1\nSimulated GMM")
plot(simfit$u, col = simfit$K, main = "Model check 2\nSimulated GMCM")
plot(sim$u, col = Khat, main = "MAP clustering")



