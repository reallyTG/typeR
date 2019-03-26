library(Rdistance)


### Name: negexp.like
### Title: Negative exponential distance function for distance analyses
### Aliases: negexp.like
### Keywords: models

### ** Examples

## Not run: 
##D set.seed(238642)
##D x <- seq(0, 100, length=100)
##D 
##D # Plots showing effects of changes in parameter Beta
##D plot(x, negexp.like(0.01, x), type="l", col="red")
##D plot(x, negexp.like(0.05, x), type="l", col="blue")
##D 
##D # Estimate 'negexp' distance function
##D Beta <- 0.01
##D x <- rexp(1000, rate=Beta)
##D dfunc <- dfuncEstim(x~1, likelihood="negexp")
##D plot(dfunc)
## End(Not run)
         



