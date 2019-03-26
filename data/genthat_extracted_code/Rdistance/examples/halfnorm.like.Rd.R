library(Rdistance)


### Name: halfnorm.like
### Title: Half-normal likelihood function for distance analyses
### Aliases: halfnorm.like
### Keywords: models

### ** Examples

 ## Not run: 
##D set.seed(238642)
##D x <- seq(0, 100, length=100)
##D 
##D # Plots showing effects of changes in parameter Sigma
##D plot(x, halfnorm.like(20, x), type="l", col="red")
##D plot(x, halfnorm.like(40, x), type="l", col="blue")
##D 
##D # Estimate 'halfnorm' distance function
##D a <- 5
##D x <- rnorm(1000, mean=0, sd=a)
##D x <- x[x >= 0]
##D dfunc <- dfuncEstim(x~1, likelihood="halfnorm")
##D plot(dfunc)
##D 
##D # evaluate the log Likelihood
##D L <- halfnorm.like(dfunc$parameters, dfunc$dist, covars=dfunc$covars, 
##D     w.lo=dfunc$w.lo, w.hi=dfunc$w.hi, 
##D     series=dfunc$series, expansions=dfunc$expansions, 
##D     scale=TRUE)
##D -sum(log(L), na.rm=TRUE)  # the negative log likelihood
## End(Not run)



