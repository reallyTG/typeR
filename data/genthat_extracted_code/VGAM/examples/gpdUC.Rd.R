library(VGAM)


### Name: gpdUC
### Title: The Generalized Pareto Distribution
### Aliases: gpdUC dgpd pgpd qgpd rgpd
### Keywords: distribution

### ** Examples

## Not run: 
##D  loc <- 2; sigma <- 1; xi <- -0.4
##D x <- seq(loc - 0.2, loc + 3, by = 0.01)
##D plot(x, dgpd(x, loc, sigma, xi), type = "l", col = "blue", ylim = c(0, 1),
##D      main = "Blue is density, red is cumulative distribution function",
##D      sub = "Purple are 5,10,...,95 percentiles", ylab = "", las = 1)
##D abline(h = 0, col = "blue", lty = 2)
##D lines(qgpd(seq(0.05, 0.95, by = 0.05), loc, sigma, xi),
##D       dgpd(qgpd(seq(0.05, 0.95, by = 0.05), loc, sigma, xi), loc, sigma, xi),
##D       col = "purple", lty = 3, type = "h")
##D lines(x, pgpd(x, loc, sigma, xi), type = "l", col = "red")
##D abline(h = 0, lty = 2)
##D 
##D pgpd(qgpd(seq(0.05, 0.95, by = 0.05), loc, sigma, xi), loc, sigma, xi)
## End(Not run)



