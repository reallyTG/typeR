library(VGAM)


### Name: Gumbel-II
### Title: The Gumbel-II Distribution
### Aliases: Gumbel-II dgumbelII pgumbelII qgumbelII rgumbelII
### Keywords: distribution

### ** Examples

probs <- seq(0.01, 0.99, by = 0.01)
Scale <- exp(1); Shape <- exp( 0.5);
max(abs(pgumbelII(qgumbelII(p = probs, shape = Shape, Scale),
                  shape = Shape, Scale) - probs))  # Should be 0

## Not run: 
##D  x <- seq(-0.1, 10, by = 0.01);
##D plot(x, dgumbelII(x, shape = Shape, Scale), type = "l", col = "blue", las = 1,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles",
##D      ylab = "", ylim = 0:1)
##D abline(h = 0, col = "blue", lty = 2)
##D lines(x, pgumbelII(x, shape = Shape, Scale), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qgumbelII(probs, shape = Shape, Scale)
##D lines(Q, dgumbelII(Q, Scale, Shape), col = "purple", lty = 3, type = "h")
##D pgumbelII(Q, shape = Shape, Scale) - probs # Should be all zero
##D abline(h = probs, col = "purple", lty = 3) 
## End(Not run)



