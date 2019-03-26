library(spatstat.local)


### Name: loccit
### Title: Locally Fitted Cluster or Cox Point Process Model
### Aliases: loccit
### Keywords: spatial models

### ** Examples

   X <- redwood[owin(c(0,1), c(-1,-1/2))]
   fit <- loccit(X, ~1, "Thomas", nd=5, control=list(maxit=20))
   fit



