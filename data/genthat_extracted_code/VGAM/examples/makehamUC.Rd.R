library(VGAM)


### Name: Makeham
### Title: The Makeham Distribution
### Aliases: Makeham dmakeham pmakeham qmakeham rmakeham
### Keywords: distribution

### ** Examples

probs <- seq(0.01, 0.99, by = 0.01)
Shape <- exp(-1); Scale <- exp(1); eps = Epsilon <- exp(-1)
max(abs(pmakeham(qmakeham(p = probs, sca = Scale, Shape, eps = Epsilon),
                 sca = Scale, Shape, eps = Epsilon) - probs))  # Should be 0

## Not run: 
##D  x <- seq(-0.1, 2.0, by = 0.01);
##D plot(x, dmakeham(x, sca = Scale, Shape, eps = Epsilon), type = "l",
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles",
##D      col = "blue", las = 1, ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(x, pmakeham(x, sca = Scale, Shape, eps = Epsilon), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qmakeham(probs, sca = Scale, Shape, eps = Epsilon)
##D lines(Q, dmakeham(Q, sca = Scale, Shape, eps = Epsilon),
##D       col = "purple", lty = 3, type = "h")
##D pmakeham(Q, sca = Scale, Shape, eps = Epsilon) - probs # Should be all zero
##D abline(h = probs, col = "purple", lty = 3) 
## End(Not run)



