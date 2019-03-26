library(HSAUR3)


### Name: respiratory
### Title: Respiratory Illness Data
### Aliases: respiratory
### Keywords: datasets

### ** Examples


  data("respiratory", package = "HSAUR3")
  mosaicplot(xtabs( ~ treatment + month + status, data = respiratory))




