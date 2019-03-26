library(spatstat)


### Name: update.kppm
### Title: Update a Fitted Cluster Point Process Model
### Aliases: update.kppm
### Keywords: spatial models

### ** Examples

 fit <- kppm(redwood ~1, "Thomas")
 fitx <- update(fit, ~ . + x)
 fitM <- update(fit, clusters="MatClust")
 fitC <- update(fit, cells)
 fitCx <- update(fit, cells ~ x)



