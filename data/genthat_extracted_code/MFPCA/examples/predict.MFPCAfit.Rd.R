library(MFPCA)


### Name: predict.MFPCAfit
### Title: Function prediction based on MFPCA results
### Aliases: predict.MFPCAfit

### ** Examples

#' # Simulate multivariate functional data on one-dimensonal domains
# and calculate MFPCA (cf. MFPCA help)
set.seed(1)
# simulate data (one-dimensional domains)
sim <-  simMultiFunData(type = "split", argvals = list(seq(0,1,0.01), seq(-0.5,0.5,0.02)),
                       M = 5, eFunType = "Poly", eValType = "linear", N = 100)
# MFPCA based on univariate FPCA
PCA <- MFPCA(sim$simData, M = 5, uniExpansions = list(list(type = "uFPCA"),
                                                     list(type = "uFPCA")))

# Reconstruct the original data
pred <- predict(PCA) # default reconstructs data used for the MFPCA fit

# plot the results: 1st element
plot(sim$simData[[1]]) # original data
plot(pred[[1]], add = TRUE, lty = 2) # reconstruction

# plot the results: 2nd element
plot(sim$simData[[2]]) # original data
plot(pred[[2]], add = TRUE, lty = 2) # reconstruction



