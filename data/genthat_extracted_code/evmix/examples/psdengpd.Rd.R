library(evmix)


### Name: psdengpd
### Title: P-Splines Density Estimate and GPD Tail Extreme Value Mixture
###   Model
### Aliases: psdengpd dpsdengpd ppsdengpd qpsdengpd rpsdengpd dpsdengpd
###   psdengpd ppsdengpd qpsdengpd rpsdengpd ppsdengpd psdengpd dpsdengpd
###   qpsdengpd rpsdengpd qpsdengpd psdengpd dpsdengpd ppsdengpd rpsdengpd
###   rpsdengpd psdengpd dpsdengpd ppsdengpd qpsdengpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = rnorm(1000)
##D xx = seq(-6, 6, 0.01)
##D y = dnorm(xx)
##D 
##D # Plenty of histogram bins (100)
##D breaks = seq(-4, 4, length.out=101)
##D 
##D # P-spline fitting with cubic B-splines, 2nd order penalty and 8 internal segments
##D # CV search for penalty coefficient. 
##D fit = fpsdengpd(x, lambdaseq = 10^seq(-5, 5, 0.25), breaks = breaks,
##D              xrange = c(-4, 4), nseg = 10, degree = 3, ord = 2)
##D hist(x, freq = FALSE, breaks = seq(-4, 4, length.out=101), xlim = c(-6, 6))
##D 
##D # P-splines only
##D with(fit, lines(xx, dpsden(xx, beta, nbinwidth, design = design.knots), lwd = 2, col = "blue"))
##D 
##D # P-splines+GPD
##D with(fit, lines(xx, dpsdengpd(xx, beta, nbinwidth, design = design.knots, 
##D    u = u, sigmau = sigmau, xi = xi, phiu = phiu), lwd = 2, col = "red"))
##D abline(v = fit$u, col = "red")
##D 
##D legend("topleft", c("True Density","P-spline density", "P-spline+GPD"),
##D  col=c("black", "blue", "red"), lty = 1)
## End(Not run)




