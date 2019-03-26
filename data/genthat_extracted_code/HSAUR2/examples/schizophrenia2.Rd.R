library(HSAUR2)


### Name: schizophrenia2
### Title: Schizophrenia Data
### Aliases: schizophrenia2
### Keywords: datasets

### ** Examples


  data("schizophrenia2", package = "HSAUR2")
  mosaicplot(xtabs( ~ onset + month + disorder, data = schizophrenia2))




