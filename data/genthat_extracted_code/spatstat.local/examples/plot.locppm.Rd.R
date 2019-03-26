library(spatstat.local)


### Name: plot.locppm
### Title: Plot a Locally Fitted Poisson or Gibbs Model
### Aliases: plot.locppm contour.locppm
### Keywords: spatial models

### ** Examples

   fit <- locppm(swedishpines, ~1, sigma=9, nd=20,
             vcalc="hessian", locations="coarse")
   plot(fit)  
   plot(fit, what="Vg")  



