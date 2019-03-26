library(fpc)


### Name: ridgeline.diagnosis
### Title: Ridgeline plots, ratios and unimodality
### Aliases: ridgeline.diagnosis
### Keywords: cluster multivariate

### ** Examples

  muarray <- cbind(c(0,0),c(0,0.1),c(10,10))
  sigmaarray <- array(c(diag(2),diag(2),diag(2)),dim=c(2,2,3))
  rd <-
  ridgeline.diagnosis(c(0.5,0.3,0.2),muarray,sigmaarray,ridgelineplot="matrix",by=0.1)
  # Much slower but more precise with default by=0.001.



