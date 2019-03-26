library(spatstat)


### Name: linearpcf
### Title: Linear Pair Correlation Function
### Aliases: linearpcf
### Keywords: spatial nonparametric

### ** Examples

  data(simplenet)
  X <- rpoislpp(5, simplenet)
  linearpcf(X)
  linearpcf(X, correction="none")



