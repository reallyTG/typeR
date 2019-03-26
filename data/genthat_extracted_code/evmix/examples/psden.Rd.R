library(evmix)


### Name: psden
### Title: P-Splines probability density function
### Aliases: psden dpsden ppsden qpsden rpsden dpsden psden ppsden qpsden
###   rpsden ppsden psden dpsden qpsden rpsden qpsden psden dpsden ppsden
###   rpsden rpsden psden dpsden ppsden qpsden

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
##D fit = fpsden(x, lambdaseq = 10^seq(-5, 5, 0.25), breaks = breaks,
##D              xrange = c(-4, 4), nseg = 10, degree = 3, ord = 2)
##D psdensity = exp(fit$bsplines %*% fit$mle)
##D 
##D hist(x, freq = FALSE, breaks = seq(-4, 4, length.out=101), xlim = c(-6, 6))
##D lines(xx, y, col = "black") # true density
##D 
##D # P-splines density from dpsden function
##D with(fit, lines(xx, dpsden(xx, beta, nbinwidth, design = design.knots), lwd = 2, col = "blue"))
##D 
##D legend("topright", c("True Density","P-spline density"), col=c("black", "blue"), lty = 1)
##D 
##D # plot B-splines
##D par(mfrow = c(2, 1))
##D with(fit, matplot(mids, as.matrix(bsplines), type = "l", lty = 1))
##D 
##D # Natural B-splines
##D knots = with(fit, seq(xrange[1], xrange[2], length.out = nseg + 1))
##D natural.knots = with(fit, c(rep(xrange[1], degree), knots, rep(xrange[2], degree)))
##D naturalb = splineDesign(natural.knots, fit$mids, ord = fit$degree + 1, outer.ok = TRUE)
##D with(fit, matplot(mids, naturalb, type = "l", lty = 1))
##D 
##D # Compare knot specifications
##D rbind(fit$design.knots, natural.knots)
##D 
##D # User can use natural B-splines if design.knots are specified manually
##D natural.fit = fpsden(x, lambdaseq = 10^seq(-5, 5, 0.25), breaks = breaks,
##D              design.knots = natural.knots, nseg = 10, degree = 3, ord = 2)
##D psdensity = with(natural.fit, exp(bsplines %*% mle))
##D 
##D par(mfrow = c(1, 1))
##D hist(x, freq = FALSE, breaks = seq(-4, 4, length.out=101), xlim = c(-6, 6))
##D lines(xx, y, col = "black") # true density
##D 
##D # check density against dpsden function
##D with(fit, lines(xx, dpsden(xx, beta, nbinwidth, design = design.knots), lwd = 2, col = "blue"))
##D with(natural.fit, lines(xx, dpsden(xx, beta, nbinwidth, design = design.knots),
##D                         lwd = 2, col = "red", lty = 2))
##D 
##D legend("topright", c("True Density", "Eilers and Marx B-splines", "Natural B-splines"),
##D    col=c("black", "blue", "red"), lty = c(1, 1, 2))
## End(Not run)




