library(ChemoSpecUtils)


### Name: plotScores
### Title: Plot Scores from PCA, MIA or PARAFAC Analysis of a Spectra or
###   Spectra2D Object
### Aliases: plotScores
### Keywords: hplot multivariate robust

### ** Examples


if (requireNamespace("ChemoSpec", quietly = TRUE)) {
  library("ChemoSpec")
  data(metMUD1)

  pca <- c_pcaSpectra(metMUD1)
  plotScores(metMUD1, pca, main = "metMUD1 NMR Data",
	   pcs = c(1,2), ellipse = "cls", tol = 0.05)
}

if (requireNamespace("ChemoSpec2D", quietly = TRUE)) {
  library("ChemoSpec2D")
  data(MUD1)

  res <- miaSpectra2D(MUD1)
  plotScores(MUD1, res, main = "MIA Scores", tol = 0.1, ellipse = "cls")

  set.seed(123)
  res <- pfacSpectra2D(MUD1, parallel = FALSE, nfac = 2)
  plotScores(MUD1, res, tol = 0.1, leg.loc = "bottomright", main = "PARAFAC Score Plot")
}




