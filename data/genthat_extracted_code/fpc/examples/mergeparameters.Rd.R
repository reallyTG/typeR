library(fpc)


### Name: mergeparameters
### Title: New parameters from merging two Gaussian mixture components
### Aliases: mergeparameters
### Keywords: multivariate cluster

### ** Examples

  options(digits=3)
  set.seed(98765)
  require(mclust)
  iriss <- iris[sample(150,20),-5]
  irisBIC <- mclustBIC(iriss)
  siris <- summary(irisBIC,iriss)
  probs <- siris$parameters$pro
  muarray <- siris$parameters$mean
  Sigmaarray <- siris$parameters$variance$sigma
  z <- siris$z
  mpi <- mergeparameters(iriss,1,2,probs,muarray,Sigmaarray,z)
  mpi$probs
  mpi$muarray



