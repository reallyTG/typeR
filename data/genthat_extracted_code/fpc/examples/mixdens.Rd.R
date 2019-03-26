library(fpc)


### Name: mixdens
### Title: Density of multivariate Gaussian mixture, mclust
###   parameterisation
### Aliases: mixdens
### Keywords: cluster multivariate

### ** Examples

  set.seed(98765)
  require(mclust)
  iriss <- iris[sample(150,20),-5]
  irisBIC <- mclustBIC(iriss)
  siris <- summary(irisBIC,iriss)
  round(mixdens(siris$modelName,iriss,siris$parameters),digits=2)



