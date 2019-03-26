library(ChemoSpec)


### Name: r_pcaSpectra
### Title: Robust PCA of a Spectra Object
### Aliases: r_pcaSpectra
### Keywords: multivariate robust

### ** Examples


data(metMUD1)
pca <- r_pcaSpectra(metMUD1)
plotScores(metMUD1, pca, main = "metMUD1 NMR Data",
  pcs = c(1,2), ellipse = "cls", tol = 0.05)
plotScree(pca)




