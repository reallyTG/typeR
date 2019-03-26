library(VGAM)


### Name: Gompertz
### Title: The Gompertz Distribution
### Aliases: Gompertz dgompertz pgompertz qgompertz rgompertz
### Keywords: distribution

### ** Examples

probs <- seq(0.01, 0.99, by = 0.01)
Shape <- exp(1); Scale <- exp(1)
max(abs(pgompertz(qgompertz(p = probs, Scale, shape = Shape),
                  Scale, shape = Shape) - probs))  # Should be 0

## Not run: 
##D  x <- seq(-0.1, 1.0, by = 0.001)
##D plot(x, dgompertz(x, Scale,shape = Shape), type = "l", col = "blue", las = 1,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles",
##D      ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(x, pgompertz(x, Scale, shape = Shape), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qgompertz(probs, Scale, shape = Shape)
##D lines(Q, dgompertz(Q, Scale, shape = Shape), col = "purple",
##D       lty = 3, type = "h")
##D pgompertz(Q, Scale, shape = Shape) - probs  # Should be all zero
##D abline(h = probs, col = "purple", lty = 3) 
## End(Not run)



