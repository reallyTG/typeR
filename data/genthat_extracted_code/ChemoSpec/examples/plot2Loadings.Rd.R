library(ChemoSpec)


### Name: plot2Loadings
### Title: Plot PCA Loadings from a Spectra Object Against Each Other
### Aliases: plot2Loadings
### Keywords: hplot multivariate

### ** Examples


data(SrE.IR)
pca <- c_pcaSpectra(SrE.IR)
myt <- expression(bolditalic(Serenoa)~bolditalic(repens)~bold(IR~Spectra))
res <- plot2Loadings(SrE.IR, pca, main = myt,
	 loads = c(1,2), tol = 0.001)




