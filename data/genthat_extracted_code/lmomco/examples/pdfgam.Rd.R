library(lmomco)


### Name: pdfgam
### Title: Probability Density Function of the Gamma Distribution
### Aliases: pdfgam
### Keywords: distribution probability density function Distribution: Gamma
###   Distribution: Generalized Gamma

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  gam <- pargam(lmr)
  x <- quagam(0.5,gam)
  pdfgam(x,gam)

## Not run: 
##D # 3-p Generalized Gamma Distribution and gamlss.dist package parameterization
##D gg <- vec2par(c(7.4, 0.2, 14), type="gam"); X <- seq(0.04,9, by=.01)
##D GGa <- gamlss.dist::dGG(X, mu=7.4, sigma=0.2, nu=14)
##D GGb <- pdfgam(X, gg) # We now compare the two densities.
##D plot( X, GGa, type="l", xlab="X", ylab="PROBABILITY DENSITY", col=3, lwd=6)
##D lines(X, GGb, col=2, lwd=2) #
## End(Not run)

## Not run: 
##D # 3-p Generalized Gamma Distribution and gamlss.dist package parameterization
##D gg <- vec2par(c(1.7, 3, -4), type="gam"); X <- seq(0.04,9, by=.01)
##D GGa <- gamlss.dist::dGG(X, mu=1.7, sigma=3, nu=-4)
##D GGb <- pdfgam(X, gg) # We now compare the two densities.
##D plot( X, GGa, type="l", xlab="X", ylab="PROBABILITY DENSITY", col=3, lwd=6)
##D lines(X, GGb, col=2, lwd=2) #
## End(Not run)



