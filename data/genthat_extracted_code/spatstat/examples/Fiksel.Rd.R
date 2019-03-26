library(spatstat)


### Name: Fiksel
### Title: The Fiksel Interaction
### Aliases: Fiksel
### Keywords: spatial models

### ** Examples

   Fiksel(r=1,hc=0.02, kappa=2)
   # prints a sensible description of itself

   data(spruces)
   X <- unmark(spruces)

   fit <- ppm(X ~ 1, Fiksel(r=3.5, kappa=1))
   plot(fitin(fit))



