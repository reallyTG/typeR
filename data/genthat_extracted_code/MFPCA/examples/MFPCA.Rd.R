library(MFPCA)


### Name: MFPCA
### Title: Multivariate functional principal component analysis for
###   functions on different (dimensional) domains
### Aliases: MFPCA

### ** Examples

oldPar <- par(no.readonly = TRUE)

set.seed(1)

### simulate data (one-dimensional domains)
sim <-  simMultiFunData(type = "split", argvals = list(seq(0,1,0.01), seq(-0.5,0.5,0.02)),
                        M = 5, eFunType = "Poly", eValType = "linear", N = 100)

# MFPCA based on univariate FPCA
uFPCA <- MFPCA(sim$simData, M = 5, uniExpansions = list(list(type = "uFPCA"),
                                                                  list(type = "uFPCA")))
summary(uFPCA)
plot(uFPCA) # plot the eigenfunctions as perturbations of the mean
scoreplot(uFPCA) # plot the scores

# MFPCA based on univariate spline expansions
splines <- MFPCA(sim$simData, M = 5, uniExpansions = list(list(type = "splines1D", k = 10),
                                                          list(type = "splines1D", k = 10)),
                 fit = TRUE) # calculate reconstruction, too
summary(splines)
plot(splines) # plot the eigenfunctions as perturbations of the mean
scoreplot(splines) # plot the scores

### Compare estimates to true eigenfunctions
# flip to make results more clear
uFPCA$functions <- flipFuns(sim$trueFuns, uFPCA$functions)
splines$functions <- flipFuns(sim$trueFuns, splines$functions)

par(mfrow = c(1,2))
plot(sim$trueFuns[[1]], main = "Eigenfunctions\n1st Element", lwd = 2)
plot(uFPCA$functions[[1]], lty = 2, add = TRUE)
plot(splines$functions[[1]], lty = 3, add = TRUE)

plot(sim$trueFuns[[2]], main = "Eigenfunctions\n2nd Element", lwd = 2)
plot(uFPCA$functions[[2]], lty = 2, add = TRUE)
plot(splines$functions[[2]], lty = 3, add = TRUE)
legend("bottomleft", c("True", "uFPCA", "splines"), lty = 1:3, lwd = c(2,1,1))

# Test reconstruction for the first 10 observations
plot(sim$simData[[1]], obs = 1:10, main = "Reconstruction\n1st Element", lwd = 2)
plot(splines$fit[[1]], obs = 1:10, lty = 2, col = 1, add = TRUE)

plot(sim$simData[[2]], obs = 1:10, main = "Reconstruction\n2nd Element", lwd = 2)
plot(splines$fit[[2]], obs = 1:10, lty = 2, col = 1, add = TRUE)
legend("bottomleft", c("True", "Reconstruction"), lty = c(1,2), lwd = c(2,1))

# MFPCA with Bootstrap-CI for the first 2 eigenfunctions
### ATTENTION: Takes long
## No test: 
splinesBoot <- MFPCA(sim$simData, M = 2, uniExpansions = list(list(type = "splines1D", k = 10),
                                                          list(type = "splines1D", k = 10)),
                 bootstrap = TRUE, nBootstrap = 100, bootstrapAlpha = c(0.05, 0.1), verbose = TRUE)
summary(splinesBoot)
                                 
plot(splinesBoot$functions[[1]], ylim = c(-2,1.5))
plot(splinesBoot$CI$alpha_0.05$lower[[1]], lty = 2, add = TRUE)
plot(splinesBoot$CI$alpha_0.05$upper[[1]], lty = 2, add = TRUE)
plot(splinesBoot$CI$alpha_0.1$lower[[1]], lty = 3, add = TRUE)
plot(splinesBoot$CI$alpha_0.1$upper[[1]], lty = 3, add = TRUE)
abline(h = 0, col = "gray")
 
plot(splinesBoot$functions[[2]], ylim = c(-1,2.5))
plot(splinesBoot$CI$alpha_0.05$lower[[2]], lty = 2, add = TRUE)
plot(splinesBoot$CI$alpha_0.05$upper[[2]], lty = 2, add = TRUE)
plot(splinesBoot$CI$alpha_0.1$lower[[2]], lty = 3, add = TRUE)
plot(splinesBoot$CI$alpha_0.1$upper[[2]], lty = 3, add = TRUE)
abline(h = 0, col = "gray")
legend("topleft", c("Estimate", "95% CI", "90% CI"), lty = 1:3, lwd = c(2,1,1))

# Plot 95% confidence bands for eigenvalues
plot(1:2, splinesBoot$values, pch = 20, ylim = c(0, 1.5), 
     main = "Estimated eigenvalues with 95% CI",
     xlab = "Eigenvalue no.", ylab = "")
arrows(1:2, splinesBoot$CIvalues$alpha_0.05$lower,
       1:2, splinesBoot$CIvalues$alpha_0.05$upper,
       length = 0.05, angle = 90, code = 3)
points(1:2, sim$trueVals[1:2], pch = 20, col = 4)
legend("topright", c("Estimate", "True value"), pch = 20, col = c(1,4))
## End(No test)

### simulate data (two- and one-dimensional domains)
### ATTENTION: Takes long
## No test: 
set.seed(2)
sim <-  simMultiFunData(type = "weighted",
                 argvals = list(list(seq(0,1,0.01), seq(-1,1,0.02)), list(seq(-0.5,0.5,0.01))),
                 M = list(c(4,5), 20), eFunType = list(c("Fourier", "Fourier"), "Poly"),
                 eValType = "exponential", N = 150)

# MFPCA based on univariate spline expansions (for images) and univariate FPCA (for functions)
pca <- MFPCA(sim$simData, M = 10,
             uniExpansions = list(list(type = "splines2D", k = c(10,12)),
                             list(type = "uFPCA")))
summary(pca)
plot(pca) # plot the eigenfunctions as perturbations of the mean
scoreplot(pca) # plot the scores

### Compare to true eigenfunctions
# flip to make results more clear
pca$functions <- flipFuns(sim$trueFuns[1:10], pca$functions)

par(mfrow = c(5,2), mar = rep(2,4))
for(m in 2:6) # for m = 1, image.plot (used in plot(funData)) produces an error...
{
  plot(sim$trueFuns[[1]], main = paste("True, m = ", m), obs = m)
  plot(pca$functions[[1]], main = paste("Estimate, m = ", m), obs = m)
}

par(mfrow = c(1,1))
plot(sim$trueFuns[[2]], main = "Eigenfunctions (2nd element)", lwd = 2, obs=  1:5)
plot(pca$functions[[2]], lty = 2, add = TRUE, obs=  1:5)
legend("bottomleft", c("True", "MFPCA"), lty = 1:2, lwd = c(2,1))
## End(No test)
par(oldPar)



