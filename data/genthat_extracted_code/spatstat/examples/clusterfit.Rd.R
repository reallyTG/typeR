library(spatstat)


### Name: clusterfit
### Title: Fit Cluster or Cox Point Process Model via Minimum Contrast
### Aliases: clusterfit
### Keywords: spatial models

### ** Examples

  fit <- clusterfit(redwood, "Thomas")
  fit
  if(interactive()){
    plot(fit)
  }
  K <- Kest(redwood)
  fit2 <- clusterfit(K, "MatClust")



