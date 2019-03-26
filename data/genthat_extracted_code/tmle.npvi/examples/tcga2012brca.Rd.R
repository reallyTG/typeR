library(tmle.npvi)


### Name: tcga2012brca
### Title: Sample breast cancer data from TCGA
### Aliases: tcga2012brca
### Keywords: datasets

### ** Examples

  data(tcga2012brca)
  nms <- names(tcga2012brca)
  ii <- grep("TP53", nms)
  obs <- tcga2012brca[[ii]]
  pairs(obs, main=nms[ii])

  thr <- 0.02
  whichSmall <- which(abs(obs[, "X"]) <= thr)
  obs[whichSmall, "X"] <- 0

  ## the code below takes ~20s to run
  ## Not run: res <- tmle.npvi(obs)



