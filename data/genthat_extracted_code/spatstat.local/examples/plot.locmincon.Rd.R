library(spatstat.local)


### Name: plot.locmincon
### Title: Plot a Locally Fitted Cluster or Cox Point Process Model
### Aliases: plot.locmincon
### Keywords: spatial models

### ** Examples

   X <- redwood[owin(c(0,1), c(-1,-1/2))]
   fitm <- locmincon(X, ~1, "Thomas", sigma=0.07)
   plot(fitm, how="smoothed")  
   plot(fitm, how="exact")  



