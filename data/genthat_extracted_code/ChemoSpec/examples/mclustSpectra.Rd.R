library(ChemoSpec)


### Name: mclustSpectra
### Title: mclust Analysis of a Spectra Object PCA Results
### Aliases: mclustSpectra
### Keywords: cluster multivariate

### ** Examples


require("mclust")
data(SrE.IR)
class <- c_pcaSpectra(SrE.IR, choice = "autoscale")
mclustSpectra(SrE.IR, class, main = "Cuticle IR", plot = "BIC")
mclustSpectra(SrE.IR, class, main = "Cuticle IR", plot = "proj")
mclustSpectra(SrE.IR, class, main = "Cuticle IR", plot = "error",
	 truth = metMUD1$groups)




