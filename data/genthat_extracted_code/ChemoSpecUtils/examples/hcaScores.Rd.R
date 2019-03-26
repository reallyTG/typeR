library(ChemoSpecUtils)


### Name: hcaScores
### Title: HCA on PCA/MIA/PARAFAC scores from a Spectra or Spectra2D Object
### Aliases: hcaScores
### Keywords: cluster multivariate

### ** Examples


if (requireNamespace("ChemoSpec", quietly = TRUE)) {
  library("ChemoSpec")
  data(metMUD1)

  pca <- c_pcaSpectra(metMUD1)
  hca <- hcaScores(metMUD1, pca, main = "metMUD1 NMR Data")
}

if (requireNamespace("ChemoSpec2D", quietly = TRUE)) {
  library("ChemoSpec2D")
  data(MUD1)

  mia <- miaSpectra2D(MUD1)
  hca <- hcaScores(MUD1, mia, scores = 1:2, main = "MIA Scores")

  set.seed(123)
  pfac <- pfacSpectra2D(MUD1, parallel = FALSE, nfac = 2)
  hca <- hcaScores(MUD1, pfac, scores = 1:2, main = "PARAFAC Score Plot")
}




