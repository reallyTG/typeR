library(VGAM)


### Name: gengammaUC
### Title: The Generalized Gamma Distribution
### Aliases: gengammaUC dgengamma.stacy pgengamma.stacy qgengamma.stacy
###   rgengamma.stacy
### Keywords: distribution

### ** Examples

## Not run: 
##D  x <- seq(0, 14, by = 0.01); d <- 1.5; Scale <- 2; k <- 6
##D plot(x, dgengamma.stacy(x, Scale, d = d, k = k), type = "l",
##D      col = "blue", ylim = 0:1,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple are 5,10,...,95 percentiles", las = 1, ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(qgengamma.stacy(seq(0.05, 0.95, by = 0.05), Scale, d = d, k = k),
##D       dgengamma.stacy(qgengamma.stacy(seq(0.05, 0.95, by = 0.05),
##D                                       Scale, d = d, k = k),
##D             Scale, d = d, k = k), col = "purple", lty = 3, type = "h")
##D lines(x, pgengamma.stacy(x, Scale, d = d, k = k), col = "orange")
##D abline(h = 0, lty = 2) 
## End(Not run)



