library(VGAM)


### Name: Perks
### Title: The Perks Distribution
### Aliases: Perks dperks pperks qperks rperks
### Keywords: distribution

### ** Examples

probs <- seq(0.01, 0.99, by = 0.01)
Shape <- exp(-1.0); Scale <- exp(1);
max(abs(pperks(qperks(p = probs, Shape, Scale),
                  Shape, Scale) - probs))  # Should be 0

## Not run: 
##D  x <- seq(-0.1, 07, by = 0.01);
##D plot(x, dperks(x, Shape, Scale), type = "l", col = "blue", las = 1,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles",
##D      ylab = "", ylim = 0:1)
##D abline(h = 0, col = "blue", lty = 2)
##D lines(x, pperks(x, Shape, Scale), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qperks(probs, Shape, Scale)
##D lines(Q, dperks(Q, Shape, Scale), col = "purple", lty = 3, type = "h")
##D pperks(Q, Shape, Scale) - probs  # Should be all zero
##D abline(h = probs, col = "purple", lty = 3) 
## End(Not run)



