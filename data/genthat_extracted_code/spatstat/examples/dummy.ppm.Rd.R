library(spatstat)


### Name: dummy.ppm
### Title: Extract Dummy Points Used to Fit a Point Process Model
### Aliases: dummy.ppm
### Keywords: spatial utilities models

### ** Examples

 data(cells)
 fit <- ppm(cells, ~1, Strauss(r=0.1))
 X <- dummy.ppm(fit)
 npoints(X)
 # this is the number of dummy points in the quadrature scheme



