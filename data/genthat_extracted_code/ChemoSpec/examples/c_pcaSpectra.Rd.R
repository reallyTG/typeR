library(ChemoSpec)


### Name: c_pcaSpectra
### Title: Classical PCA of Spectra Objects
### Aliases: c_pcaSpectra
### Keywords: multivariate

### ** Examples


data(metMUD1)
pca <- c_pcaSpectra(metMUD1)
plotScores(metMUD1, pca, main = "metMUD1 NMR Data",
	 pcs = c(1,2), ellipse = "cls", tol = 0.05)




