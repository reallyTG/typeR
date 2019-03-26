library(lmomco)


### Name: quarice
### Title: Quantile Function of the Rice Distribution
### Aliases: quarice
### Keywords: distribution quantile function Distribution: Rice

### ** Examples

lmr <- vec2lmom(c(125,0.20), lscale=FALSE)
quarice(0.75,parrice(lmr))
# The quantile function of the Rice as implemented in lmomco
# is slow because of rooting the CDF, which is created by
# integration of the PDF. Rician random variates are easily created.
# Thus, in speed applications the rlmomco() with a Rice parameter
# object could be bypassed by the following function, rrice().
## Not run: 
##D "rrice" = function(n, nu, alpha) { # from the VGAM package
##D     theta = 1 # any number
##D     X = rnorm(n, mean=nu * cos(theta), sd=alpha)
##D     Y = rnorm(n, mean=nu * sin(theta), sd=alpha)
##D     return(sqrt(X^2 + Y^2))
##D }
##D n <- 5000; # suggest making it about 10,000
##D nu <- 100; alpha <- 10
##D set.seed(501); lmoms(rrice(n, nu, alpha))
##D set.seed(501); lmoms(rlmomco(n, vec2par(c(nu,alpha), type='rice')))
##D # There are slight numerical differences between the two?
## End(Not run)



