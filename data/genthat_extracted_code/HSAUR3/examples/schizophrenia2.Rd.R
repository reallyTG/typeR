library(HSAUR3)


### Name: schizophrenia2
### Title: Schizophrenia Data
### Aliases: schizophrenia2
### Keywords: datasets

### ** Examples


  data("schizophrenia2", package = "HSAUR3")
  mosaicplot(xtabs( ~ onset + month + disorder, data = schizophrenia2))




