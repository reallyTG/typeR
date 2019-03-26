library(lmomco)


### Name: cdfgam
### Title: Cumulative Distribution Function of the Gamma Distribution
### Aliases: cdfgam
### Keywords: distribution cumulative distribution function Distribution:
###   Gamma Distribution: Generalized Gamma

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  cdfgam(50,pargam(lmr))

  # A manual demonstration of a gamma parent
  G  <- vec2par(c(0.6333,1.579),type='gam') # the parent
  F1 <- 0.25         # nonexceedance probability
  x  <- quagam(F1,G) # the lower quartile (F=0.25)
  a  <- 0.6333       # gamma parameter
  b  <- 1.579        # gamma parameter
  # compute the integral
  xf <- function(t,A,B) { t^(A-1)*exp(-t/B) }
  Q  <- integrate(xf,0,x,A=a,B=b)
  # finish the math
  F2 <- Q$val*b^(-a)/gamma(a)
  # check the result
  if(abs(F1-F2) < 1e-8) print("yes")

## Not run: 
##D # 3-p Generalized Gamma Distribution and gamlss.dist package parameterization
##D gg <- vec2par(c(7.4, 0.2, 14), type="gam"); X <- seq(0.04,9, by=.01)
##D GGa <- gamlss.dist::pGG(X, mu=7.4, sigma=0.2, nu=14)
##D GGb <- cdfgam(X, gg) # lets compare the two cumulative probabilities
##D plot( X, GGa, type="l", xlab="X", ylab="PROBABILITY", col=3, lwd=6)
##D lines(X, GGb, col=2, lwd=2) #
## End(Not run)

## Not run: 
##D # 3-p Generalized Gamma Distribution and gamlss.dist package parameterization
##D gg <- vec2par(c(4, 1.5, -.6), type="gam"); X <- seq(0,1000, by=1)
##D GGa <- 1-gamlss.dist::pGG(X, mu=4, sigma=1.5, nu=-.6) # Note 1-... (pGG bug?)
##D GGb <- cdfgam(X, gg) # lets compare the two cumulative probabilities
##D plot( X, GGa, type="l", xlab="X", ylab="PROBABILITY", col=3, lwd=6)
##D lines(X, GGb, col=2, lwd=2) #
## End(Not run)



