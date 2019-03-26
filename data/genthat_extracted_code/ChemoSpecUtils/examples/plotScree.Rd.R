library(ChemoSpecUtils)


### Name: plotScree
### Title: Scree Plots from PCA or MIA Analysis of a Spectra or Spectra2D
###   Object
### Aliases: plotScree
### Keywords: hplot multivariate

### ** Examples


if (requireNamespace("ChemoSpec", quietly = TRUE)) {
  library("ChemoSpec")
  data(metMUD1)

  pca <- c_pcaSpectra(metMUD1)
  plotScree(pca, style = "trad")
  plotScree(pca, style = "alt")
}

if (requireNamespace("ChemoSpec2D", quietly = TRUE)) {
  library("ChemoSpec2D")
  data(MUD1)

  mia <- miaSpectra2D(MUD1)
  plotScree(mia, style = "alt")
}





