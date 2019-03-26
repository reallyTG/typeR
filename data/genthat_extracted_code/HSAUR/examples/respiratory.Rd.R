library(HSAUR)


### Name: respiratory
### Title: Respiratory Illness Data
### Aliases: respiratory
### Keywords: datasets

### ** Examples


  data("respiratory", package = "HSAUR")
  mosaicplot(xtabs( ~ treatment + month + status, data = respiratory))




