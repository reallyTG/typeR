library(evmix)


### Name: fpsdengpd
### Title: MLE Fitting of P-splines Density Estimate for Bulk and GPD Tail
###   Extreme Value Mixture Model
### Aliases: fpsdengpd lpsdengpd nlpsdengpd proflupsdengpd nlupsdengpd
###   lpsdengpd fpsdengpd nlpsdengpd proflupsdengpd nlupsdengpd nlpsdengpd
###   fpsdengpd lpsdengpd proflupsdengpd nlupsdengpd proflupsdengpd
###   fpsdengpd lpsdengpd nlpsdengpd nlupsdengpd nlupsdengpd fpsdengpd
###   lpsdengpd nlpsdengpd proflupsdengpd

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
##D fit = fpsdengpd(x, useq = seq(0, 3, 0.1), fixedu = TRUE,
##D              lambdaseq = 10^seq(-5, 5, 0.25), breaks = breaks,
##D              xrange = c(-4, 4), nseg = 10, degree = 3, ord = 2)
##D              
##D hist(x, freq = FALSE, breaks = breaks, xlim = c(-6, 6))
##D lines(xx, y, col = "black") # true density
##D 
##D # P-splines+GPD
##D with(fit, lines(xx, dpsdengpd(xx, beta, nbinwidth, 
##D                               u = u, sigmau = sigmau, xi = xi, design = design.knots),
##D                 lwd = 2, col = "red"))
##D abline(v = fit$u, col = "red", lwd = 2, lty = 3)
##D 
##D # P-splines density estimate
##D with(fit, lines(xx, dpsden(xx, beta, nbinwidth, design = design.knots),
##D                 lwd = 2, col = "blue", lty = 2))
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
##D legend("topright", c("True Density","P-spline density","P-spline+GPD"),
##D   col=c("black", "blue", "red"), lty = c(1, 2, 1))
##D legend("topleft", c("Internal Knots", "Boundaries", "Extra Knots", "Threshold"),
##D   col=c("blue", "green", "red", "red"), lty = c(1, 1, 1, 2))
## End(Not run)
  



