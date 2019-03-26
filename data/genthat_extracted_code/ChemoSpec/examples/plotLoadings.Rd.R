library(ChemoSpec)


### Name: plotLoadings
### Title: Plot PCA Loadings for a Spectra Object
### Aliases: plotLoadings
### Keywords: hplot multivariate

### ** Examples


data(SrE.IR)
pca <- c_pcaSpectra(SrE.IR, choice = "noscale")
myt <- expression(bolditalic(Serenoa)~bolditalic(repens)~bold(IR~Spectra))
plotLoadings(SrE.IR, pca, main = myt,
	 loads = 1:2, ref = 1)




