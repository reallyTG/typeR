library(evmix)


### Name: fpsden
### Title: MLE Fitting of P-splines Density Estimator
### Aliases: fpsden lpsden nlpsden iwlspsden cvpsden lpsden fpsden nlpsden
###   iwlspsden cvpsden nlpsden fpsden lpsden iwlspsden cvpsden cvpsden
###   fpsden lpsden nlpsden iwlspsden iwlspsden fpsden lpsden nlpsden
###   cvpsden

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = rnorm(1000)
##D xx = seq(-4, 4, 0.01)
##D y = dnorm(xx)
##D 
##D # Plenty of histogram bins (100)
##D breaks = seq(-4, 4, length.out=101)
##D 
##D # P-spline fitting with cubic B-splines, 2nd order penalty and 10 internal segments
##D # CV search for penalty coefficient. 
##D fit = fpsden(x, lambdaseq = 10^seq(-5, 5, 0.25), breaks = breaks,
##D              xrange = c(-4, 4), nseg = 10, degree = 3, ord = 2)
##D psdensity = exp(fit$bsplines %*% fit$mle)
##D 
##D hist(x, freq = FALSE, breaks = seq(-4, 4, length.out=101), xlim = c(-6, 6))
##D lines(xx, y, col = "black") # true density
##D 
##D lines(fit$mids, psdensity/fit$nbinwidth, lwd = 2, col = "blue") # P-splines density
##D 
##D # check density against dpsden function
##D with(fit, lines(xx, dpsden(xx, beta, nbinwidth, design = design.knots),
##D                 lwd = 2, col = "red", lty = 2))
##D 
##D # vertical lines for all knots
##D with(fit, abline(v = design.knots, col = "red"))
##D 
##D # internal knots
##D with(fit, abline(v = design.knots[(degree + 2):(length(design.knots) - degree - 1)], col = "blue"))
##D   
##D # boundary knots (support of B-splines)
##D with(fit, abline(v = design.knots[c(degree + 1, length(design.knots) - degree)], col = "green"))
##D 
##D legend("topright", c("True Density","P-spline density","Using dpsdens function"),
##D   col=c("black", "blue", "red"), lty = c(1, 1, 2))
##D legend("topleft", c("Internal Knots", "Boundaries", "Extra Knots"),
##D   col=c("blue", "green", "red"), lty = 1)
## End(Not run)
  



