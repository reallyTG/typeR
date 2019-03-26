library(fpc)


### Name: mixpredictive
### Title: Prediction strength of merged Gaussian mixture
### Aliases: mixpredictive
### Keywords: cluster multivariate

### ** Examples

  set.seed(98765)
  iriss <- iris[sample(150,20),-5]
  mp <- mixpredictive(iriss,2,2,M=2)



