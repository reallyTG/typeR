library(MFPCA)


### Name: plot.MFPCAfit
### Title: Plot MFPCA results
### Aliases: plot.MFPCAfit

### ** Examples

# Simulate multivariate functional data on one-dimensonal domains
# and calculate MFPCA (cf. MFPCA help)
set.seed(1)
# simulate data (one-dimensional domains)
sim <-  simMultiFunData(type = "split", argvals = list(seq(0,1,0.01), seq(-0.5,0.5,0.02)),
                       M = 5, eFunType = "Poly", eValType = "linear", N = 100)
# MFPCA based on univariate FPCA
PCA <- MFPCA(sim$simData, M = 5, uniExpansions = list(list(type = "uFPCA"),
                                                     list(type = "uFPCA")))

# Plot the results
plot(PCA, combined = TRUE) # combine addition and subtraction in one plot



