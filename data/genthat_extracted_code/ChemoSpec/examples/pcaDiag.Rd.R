library(ChemoSpec)


### Name: pcaDiag
### Title: Outlier Diagnostic Plots for PCA of a Spectra Object
### Aliases: pcaDiag
### Keywords: multivariate

### ** Examples


data(SrE.IR)
res <- c_pcaSpectra(SrE.IR, choice = "noscale")
temp <- pcaDiag(SrE.IR, res, pcs = 2, plot = "OD")
temp <- pcaDiag(SrE.IR, res, pcs = 2, plot = "SD")




