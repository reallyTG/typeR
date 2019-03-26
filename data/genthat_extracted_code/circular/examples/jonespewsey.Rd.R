library(circular)


### Name: JonesPewsey
### Title: Jones and Pewsey Density Function
### Aliases: djonespewsey jonespewsey
### Keywords: distribution circle circular

### ** Examples

ff <- function(x) djonespewsey(x, mu=circular(4), kappa=1.8, psi=-.6)
curve.circular(ff, join=TRUE, xlim=c(-1, 1), ylim=c(-1.2, 1.2),
  main="Density of a JonesPewsey Distribution",
  xlab=expression(paste(mu,"=1.3",pi,", ",kappa,"=1.8, ",psi,"=-0.6"))
  )



