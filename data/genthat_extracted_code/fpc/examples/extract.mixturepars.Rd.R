library(fpc)


### Name: extract.mixturepars
### Title: Extract parameters for certain components from mclust
### Aliases: extract.mixturepars
### Keywords: cluster multivariate

### ** Examples

  set.seed(98765)
  options(digits=2)
  require(mclust)
  iriss <- iris[sample(150,20),-5]
  irisBIC <- mclustBIC(iriss)
  siris <- summary(irisBIC,iriss)
  extract.mixturepars(siris,2)



