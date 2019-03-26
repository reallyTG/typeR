library(fpc)


### Name: prediction.strength
### Title: Prediction strength for estimating number of clusters
### Aliases: prediction.strength print.predstr
### Keywords: cluster multivariate

### ** Examples

  options(digits=3)
  set.seed(98765)
  iriss <- iris[sample(150,20),-5]
  prediction.strength(iriss,2,3,M=3)
  prediction.strength(iriss,2,3,M=3,clustermethod=claraCBI)
# The examples are fast, but of course M should really be larger.



