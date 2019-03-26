library(bdots)


### Name: find.mod.alpha
### Title: Calculate a corrected alpha
### Aliases: find.mod.alpha
### Keywords: ts

### ** Examples

## Not run: 
##D # Sample Data
##D x <- numeric(500)
##D x[1] <- rnorm(1)
##D for(i in 2:500) x[i] <- rnorm(1, x[i - 1] * .9, 1 - .9 ^ 2)
##D 
##D # Estimate autocorrelation
##D # Assume the x values are t-statistics based on 50 subjects
##D rho.est <- ar(x, FALSE, order.max = 1)$ar
##D alphastar <- find.mod.alpha(rho.est, alpha = .05, n = 500, df = 49)
##D alphastar
## End(Not run)


