library(VGAM)


### Name: gevUC
### Title: The Generalized Extreme Value Distribution
### Aliases: gevUC dgev pgev qgev rgev
### Keywords: distribution

### ** Examples
 loc <- 2; sigma <- 1; xi <- -0.4
pgev(qgev(seq(0.05, 0.95, by = 0.05), loc, sigma, xi), loc, sigma, xi)
## Not run: 
##D  x <- seq(loc - 3, loc + 3, by = 0.01)
##D plot(x, dgev(x, loc, sigma, xi), type = "l", col = "blue", ylim = c(0, 1),
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple are 10,...,90 percentiles", ylab = "", las = 1)
##D abline(h = 0, col = "blue", lty = 2)
##D lines(qgev(seq(0.1, 0.9, by = 0.1), loc, sigma, xi),
##D       dgev(qgev(seq(0.1, 0.9, by = 0.1), loc, sigma, xi), loc, sigma, xi),
##D       col = "purple", lty = 3, type = "h")
##D lines(x, pgev(x, loc, sigma, xi), type = "l", col = "orange")
##D abline(h = (0:10)/10, lty = 2, col = "gray50")
## End(Not run)



