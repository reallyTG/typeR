library(spatstat)


### Name: Kmodel.dppm
### Title: K-function or Pair Correlation Function of a Determinantal Point
###   Process Model
### Aliases: Kmodel.detpointprocfamily pcfmodel.detpointprocfamily
###   Kmodel.dppm pcfmodel.dppm

### ** Examples

  model <- dppMatern(lambda=100, alpha=.01, nu=1, d=2)
  KMatern <- Kmodel(model)
  pcfMatern <- pcfmodel(model)
  plot(KMatern, xlim = c(0,0.05))
  plot(pcfMatern, xlim = c(0,0.05))



