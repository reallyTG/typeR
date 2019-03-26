library(lmomco)


### Name: pp.median
### Title: Quantile Function of the Ranks of Plotting Positions
### Aliases: pp.median
### Keywords: plotting position rankit

### ** Examples

## Not run: 
##D X <- rexp(10)*rexp(10)
##D means  <- pp(X, sort=FALSE)
##D median <- pp.median(X)
##D supposed.median <- pp(X, a=0.3175, sort=FALSE)
##D lmr <- lmoms(X)
##D par <- parwak(lmr)
##D F <- nonexceeds()
##D plot(F, qlmomco(F,par), type="l", log="y")
##D points(means, X)
##D points(median, X, col=2)
##D points(supposed.median, X, pch=16, col=2, cex=0.5)
##D # The plot shows that the median and supposed.median by the plotting-position
##D # formula are effectively equivalent. Thus, the partial application it seems
##D # that a=0.3175 would be good enough in lieu of the complexity of the
##D # quantile function of the Beta distribution.
## End(Not run)



