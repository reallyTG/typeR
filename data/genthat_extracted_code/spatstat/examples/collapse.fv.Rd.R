library(spatstat)


### Name: collapse.fv
### Title: Collapse Several Function Tables into One
### Aliases: collapse.fv collapse.anylist
### Keywords: spatial manip

### ** Examples

  # generate simulated data
  X <- replicate(3, rpoispp(100), simplify=FALSE)
  names(X) <- paste("Simulation", 1:3)
  # compute K function estimates
  Klist <- anylapply(X, Kest)
  # collapse
  K <- collapse(Klist, same="theo", different="iso")
  K



