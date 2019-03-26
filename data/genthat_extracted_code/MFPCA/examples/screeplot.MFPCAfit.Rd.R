library(MFPCA)


### Name: screeplot.MFPCAfit
### Title: Screeplot for Multivariate Functional Principal Component
###   Analysis
### Aliases: screeplot.MFPCAfit

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

# screeplot
screeplot(PCA) # default options
screeplot(PCA, npcs = 3, type = "barplot", main= "Screeplot")



