library(VGAM)


### Name: genray
### Title: The Generalized Rayleigh Distribution
### Aliases: genray dgenray pgenray qgenray rgenray
### Keywords: distribution

### ** Examples

## Not run: 
##D shape <- 0.5; Scale <- 1; nn <- 501
##D x <- seq(-0.10, 3.0, len = nn)
##D plot(x, dgenray(x, shape, scale = Scale), type = "l", las = 1, ylim = c(0, 1.2),
##D      ylab = paste("[dp]genray(shape = ", shape, ", scale = ", Scale, ")"),
##D      col = "blue", cex.main = 0.8,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles")
##D lines(x, pgenray(x, shape, scale = Scale), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qgenray(probs, shape, scale = Scale)
##D lines(Q, dgenray(Q, shape, scale = Scale), col = "purple", lty = 3, type = "h")
##D lines(Q, pgenray(Q, shape, scale = Scale), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D max(abs(pgenray(Q, shape, scale = Scale) - probs))  # Should be 0
## End(Not run)



