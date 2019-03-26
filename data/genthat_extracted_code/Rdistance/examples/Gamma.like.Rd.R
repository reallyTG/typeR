library(Rdistance)


### Name: Gamma.like
### Title: Gamma distance function for distance analyses
### Aliases: Gamma.like
### Keywords: models

### ** Examples

## Not run: 
##D set.seed(238642)
##D x <- seq(0, 100, length=100)
##D 
##D # Plots showing effects of changes in shape
##D plot(x, Gamma.like(c(20,20), x), type="l", col="red")
##D plot(x, Gamma.like(c(40,20), x), type="l", col="blue")
##D 
##D # Plots showing effects of changes in scale
##D plot(x, Gamma.like(c(20,20), x), type="l", col="red")
##D plot(x, Gamma.like(c(20,40), x), type="l", col="blue")
##D 
##D # Estimate 'Gamma' distance function
##D r <- 5
##D lam <- 10
##D b <- (1/gamma(r)) * (((r - 1)/exp(1))^(r - 1))
##D x <- rgamma(1000, shape=r, scale=b*lam)
##D dfunc <- dfuncEstim(x~1, likelihood="Gamma", x.scl="max")
##D plot(dfunc)
## End(Not run)



