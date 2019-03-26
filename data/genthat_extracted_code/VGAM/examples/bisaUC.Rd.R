library(VGAM)


### Name: Bisa
### Title: The Birnbaum-Saunders Distribution
### Aliases: Bisa dbisa pbisa qbisa rbisa
### Keywords: distribution

### ** Examples

## Not run: 
##D x <- seq(0, 6, len = 400)
##D plot(x, dbisa(x, shape = 1), type = "l", col = "blue",
##D      ylab = "Density", lwd = 2, ylim = c(0,1.3), lty = 3,
##D      main = "X ~ Birnbaum-Saunders(shape, scale = 1)")
##D lines(x, dbisa(x, shape = 2), col = "orange", lty = 2, lwd = 2)
##D lines(x, dbisa(x, shape = 0.5), col = "green", lty = 1, lwd = 2)
##D legend(x = 3, y = 0.9, legend = paste("shape  = ",c(0.5, 1,2)),
##D        col = c("green","blue","orange"), lty = 1:3, lwd = 2)
##D 
##D shape <- 1; x <- seq(0.0, 4, len = 401)
##D plot(x, dbisa(x, shape = shape), type = "l", col = "blue", las = 1, ylab = "",
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles", ylim = 0:1)
##D abline(h = 0, col = "blue", lty = 2)
##D lines(x, pbisa(x, shape = shape), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qbisa(probs, shape = shape)
##D lines(Q, dbisa(Q, shape = shape), col = "purple", lty = 3, type = "h")
##D pbisa(Q, shape = shape) - probs  # Should be all zero
##D abline(h = probs, col = "purple", lty = 3)
##D lines(Q, pbisa(Q, shape = shape), col = "purple", lty = 3, type = "h")
## End(Not run)



