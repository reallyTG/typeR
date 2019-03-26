library(ChemoSpec)


### Name: plotScores3D
### Title: 3D PCA Score Plot for a Spectra Object
### Aliases: plotScores3D
### Keywords: hplot multivariate

### ** Examples


data(metMUD1)
pca <- c_pcaSpectra(metMUD1, choice = "noscale")
plotScores3D(metMUD1, pca, main = "metMUD1 NMR Spectra")




