library(HSAUR2)


### Name: respiratory
### Title: Respiratory Illness Data
### Aliases: respiratory
### Keywords: datasets

### ** Examples


  data("respiratory", package = "HSAUR2")
  mosaicplot(xtabs( ~ treatment + month + status, data = respiratory))




