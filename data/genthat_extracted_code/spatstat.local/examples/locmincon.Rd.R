library(spatstat.local)


### Name: locmincon
### Title: Locally Fitted Cluster or Cox Point Process Model
### Aliases: locmincon
### Keywords: spatial models

### ** Examples

   X <- redwood[owin(c(0,1), c(-1,-1/2))]
   fit <- locmincon(X, ~1, "Thomas", sigma=0.07)
   fit



