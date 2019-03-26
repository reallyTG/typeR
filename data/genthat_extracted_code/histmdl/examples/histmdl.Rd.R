library(histmdl)


### Name: histmdl
### Title: Most Informative Histograms
### Aliases: histmdl
### Keywords: histogram dplot hplot distribution

### ** Examples

  set.seed (28011988)

  x <- c (rnorm (1000, -6), rnorm (1000, 6))
  histmdl (x, gain=2, col="peru")
  hist (x, freq=FALSE, add=TRUE, col="#80808080")

  x <- c (runif (50), runif (50, max=3))
  histmdl (x, col="peru", ylim=0:1)
  hist (x, freq=FALSE, add=TRUE, col="#80808080")



