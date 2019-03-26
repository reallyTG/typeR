library(circular)


### Name: GenVonMises
### Title: Generalized Von Mises Density Function
### Aliases: dgenvonmises genvonmises
### Keywords: distribution circle circular vonMises

### ** Examples

ff <- function(x) dgenvonmises(x, mu1=circular(5*pi/4), mu2=circular(pi/4), kappa1=.3, kappa2=1)
curve.circular(ff, join=TRUE, xlim=c(-1, 1), ylim=c(-1.2, 1.2),
  main="Density of a Generalized von Mises Distribution",
  xlab=expression(paste(mu,"1=5/4",pi,", ",mu2,"=",pi/4,", ",kappa,"1=0.3, ",kappa,"2=1"))
  )



