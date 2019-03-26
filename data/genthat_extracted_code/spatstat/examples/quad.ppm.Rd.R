library(spatstat)


### Name: quad.ppm
### Title: Extract Quadrature Scheme Used to Fit a Point Process Model
### Aliases: quad.ppm
### Keywords: spatial manip models

### ** Examples

 fit <- ppm(cells ~1, Strauss(r=0.1))
 Q <- quad.ppm(fit)
 ## Not run: plot(Q)
 npoints(Q$data)
 npoints(Q$dummy)



