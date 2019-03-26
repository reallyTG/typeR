library(MFPCA)


### Name: PACE
### Title: Univariate functional principal component analysis by smoothed
###   covariance
### Aliases: PACE

### ** Examples

## No test: 
  oldPar <- par(no.readonly = TRUE)

  # simulate data
  sim <- simFunData(argvals = seq(-1,1,0.01), M = 5, eFunType = "Poly",
                    eValType = "exponential", N = 100)

  # calculate univariate FPCA
  pca <- PACE(sim$simData, npc = 5)

  # Plot the results
  par(mfrow = c(1,2))
  plot(sim$trueFuns, lwd = 2, main = "Eigenfunctions")
  # flip estimated functions for correct signs
  plot(flipFuns(sim$trueFuns,pca$functions), lty = 2, add = TRUE)
  legend("bottomright", c("True", "Estimate"), lwd = c(2,1), lty = c(1,2))

  plot(sim$simData, lwd = 2, main = "Some Observations", obs = 1:7)
  plot(pca$fit, lty = 2, obs = 1:7, add = TRUE) # estimates are almost equal to true values
  legend("bottomright", c("True", "Estimate"), lwd = c(2,1), lty = c(1,2))

  par(oldPar)
## End(No test)



