library(spatstat)


### Name: clusterset
### Title: Allard-Fraley Estimator of Cluster Feature
### Aliases: clusterset
### Keywords: spatial classif

### ** Examples

  opa <- par(mfrow=c(1,2))
  W <- grow.rectangle(as.rectangle(letterR), 1)
  X <- superimpose(runifpoint(300, letterR),
                   runifpoint(50, W), W=W)
  plot(W, main="clusterset(X, 'm')")
  plot(clusterset(X, "marks", fast=TRUE), add=TRUE, chars=c(1, 3), cols=1:2)
  plot(letterR, add=TRUE)
  plot(W, main="clusterset(X, 'd')")
  plot(clusterset(X, "domain", exact=FALSE), add=TRUE)
  plot(letterR, add=TRUE)
  par(opa)



