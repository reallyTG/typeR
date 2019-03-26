library(rv)


### Name: numeric_rv
### Title: Numeric Random Vectors
### Aliases: numeric_rv numeric.rv as.numeric.rv is.numeric.rv
###   is.numeric.rvfactor as.numeric.rvfactor
### Keywords: classes

### ** Examples


  x <- as.logical(rvbern(1,0.5)) # Bernoulli rv
  is.numeric(x)           # FALSE
  x <- as.numeric(x)      # coerce to numeric; all TRUEs become ones, FALSEs zeros
  is.numeric(x)           # TRUE




