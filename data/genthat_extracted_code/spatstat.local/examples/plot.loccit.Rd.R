library(spatstat.local)


### Name: plot.loccit
### Title: Plot a Locally Fitted Cluster or Cox Point Process Model
### Aliases: plot.loccit
### Keywords: spatial models

### ** Examples

   X <- redwood[owin(c(0,1), c(-1,-1/2))]
   fitc <- loccit(X, ~1, "Thomas", nd=5, control=list(maxit=20))
   plot(fitc, how="exact")  
   plot(fitc, how="smoothed")  



