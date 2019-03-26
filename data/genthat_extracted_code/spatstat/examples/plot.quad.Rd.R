library(spatstat)


### Name: plot.quad
### Title: Plot a Spatial Quadrature Scheme
### Aliases: plot.quad
### Keywords: spatial hplot

### ** Examples

   data(nztrees)
   Q <- quadscheme(nztrees)

   plot(Q, main="NZ trees: quadrature scheme")

   oldpar <- par(mfrow=c(2,1))
   plot(Q, main="NZ trees", dum=list(add=FALSE))
   par(oldpar)



