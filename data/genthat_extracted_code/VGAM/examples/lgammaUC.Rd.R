library(VGAM)


### Name: lgammaUC
### Title: The Log-Gamma Distribution
### Aliases: lgammaUC dlgamma plgamma qlgamma rlgamma
### Keywords: distribution

### ** Examples

## Not run: 
##D  loc <- 1; Scale <- 1.5; shape <- 1.4
##D x <- seq(-3.2, 5, by = 0.01)
##D plot(x, dlgamma(x, loc = loc, Scale, shape = shape), type = "l",
##D      col = "blue", ylim = 0:1,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple are 5,10,...,95 percentiles", las = 1, ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(qlgamma(seq(0.05, 0.95, by = 0.05), loc = loc, Scale, shape = shape),
##D       dlgamma(qlgamma(seq(0.05, 0.95, by = 0.05), loc = loc, scale = Scale,
##D                       shape = shape),
##D       loc = loc, Scale, shape = shape), col = "purple", lty = 3, type = "h")
##D lines(x, plgamma(x, loc = loc, Scale, shape = shape), col = "orange")
##D abline(h = 0, lty = 2) 
## End(Not run)



