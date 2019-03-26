library(lmomco)


### Name: quagam
### Title: Quantile Function of the Gamma Distribution
### Aliases: quagam
### Keywords: distribution quantile function Distribution: Gamma
###   Distribution: Generalized Gamma

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  g <- pargam(lmr)
  quagam(0.5,g)
## Not run: 
##D   # generate 50 random samples from this fitted parent
##D   Qsim <- rlmomco(5000,g)
##D   # compute the apparent gamma parameter for this parent
##D   gsim <- pargam(lmoms(Qsim))
## End(Not run)

## Not run: 
##D # 3-p Generalized Gamma Distribution and gamlss.dist package parameterization
##D gg <- vec2par(c(2, 4, 3), type="gam")
##D X <- gamlss.dist::rGG(1000, mu=2, sigma=4, nu=3); FF <- nonexceeds(sig6=TRUE)
##D plot(qnorm(lmomco::pp(X)), sort(X), pch=16, col=8) # lets compare the two quantiles
##D lines(qnorm(FF), gamlss.dist::qGG(FF, mu=2, sigma=4, nu=3), lwd=6, col=3)
##D lines(qnorm(FF), quagam(FF, gg), col=2, lwd=2) # 
## End(Not run)

## Not run: 
##D # 3-p Generalized Gamma Distribution and gamlss.dist package parameterization
##D gg <- vec2par(c(7.4, 0.2, -3), type="gam")
##D X <- gamlss.dist::rGG(1000, mu=7.4, sigma=0.2, nu=-3); FF <- nonexceeds(sig6=TRUE)
##D plot(qnorm(lmomco::pp(X)), sort(X), pch=16, col=8) # lets compare the two quantiles
##D lines(qnorm(FF), gamlss.dist::qGG(FF, mu=7.4, sigma=0.2, nu=-3), lwd=6, col=3)
##D lines(qnorm(FF), quagam(FF, gg), col=2, lwd=2) # 
## End(Not run)



