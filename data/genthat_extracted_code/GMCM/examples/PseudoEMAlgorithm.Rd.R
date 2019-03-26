library(GMCM)


### Name: PseudoEMAlgorithm
### Title: EM-like algorithm for the GMCM
### Aliases: PseudoEMAlgorithm
### Keywords: internal

### ** Examples

set.seed(1)

# Choosing the true parameters and simulating data
true.par <- c(0.8, 3, 1.5, 0.4)
data <- SimulateGMCMData(n = 1000, par = true.par, d = 2)
uhat <- Uhat(data$u)  # Observed ranks

# Plot of latent and observed data colour coded by the true component
par(mfrow = c(1,2))
plot(data$z, main = "Latent data", cex = 0.6,
     xlab = "z (Experiment 1)", ylab = "z (Experiment 2)",
     col = c("red","blue")[data$K])
plot(uhat, main = "Observed data", cex = 0.6,
     xlab = "u (Experiment 1)", ylab = "u (Experiment 2)",
     col = c("red","blue")[data$K])

# Fit the model using the Pseudo EM algorithm
init.par <- c(0.5, 1, 1, 0.5)
res <- GMCM:::PseudoEMAlgorithm(uhat, meta2full(init.par, d = 2),
                                verbose = TRUE,
                                convergence.criterion = "absGMCM",
                                eps = 1e-4,
                                trace.theta = FALSE,
                                meta.special.case = TRUE)

# Compute posterior cluster probabilities
IDRs <- get.IDR(uhat, par = full2meta(res$theta))

# Plot of observed data colour coded by the MAP estimate
plot(res$loglik[3,], main = "Loglikelihood trace", type = "l",
     ylab = "log GMCM likelihood")
abline(v = which.max(res$loglik[3,])) # Chosen MLE
plot(uhat, main = "Clustering\nIDR < 0.05", xlab = "", ylab = "", cex = 0.6,
     col = c("Red","Blue")[IDRs$Khat])

# View parameters
rbind(init.par, true.par, estimate = full2meta(res$theta))

# Confusion matrix
table("Khat" = IDRs$Khat, "K" = data$K)



