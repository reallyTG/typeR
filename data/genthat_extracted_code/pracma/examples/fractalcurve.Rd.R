library(pracma)


### Name: fractalcurve
### Title: Fractal Curves
### Aliases: fractalcurve
### Keywords: math

### ** Examples

## The Hilbert curve transforms a 2-dim. function into a time series.
z <- fractalcurve(4, which = "hilbert")

## Not run: 
##D f1 <- function(x, y) x^2 + y^2
##D plot(f1(z$x, z$y), type = 'l', col = "darkblue", lwd = 2,
##D      ylim = c(-1, 2), main = "Functions transformed by Hilbert curves")
##D 
##D f2 <- function(x, y) x^2 - y^2
##D lines(f2(z$x, z$y), col = "darkgreen", lwd = 2)
##D 
##D f3 <- function(x, y) x^2 * y^2
##D lines(f3(z$x, z$y), col = "darkred", lwd = 2)
##D grid()
## End(Not run)

## Not run: 
##D ## Show some more fractal surves
##D n <- 8
##D opar <- par(mfrow=c(2,2), mar=c(2,2,1,1))
##D 
##D z <- fractalcurve(n, which="dragon")
##D x <- z$x; y <- z$y
##D plot(x, y, type='l', col="darkgrey", lwd=2)
##D title("Dragon Curve")
##D 
##D z <- fractalcurve(n, which="molecule")
##D x <- z$x; y <- z$y
##D plot(x, y, type='l', col="darkblue")
##D title("Molecule Curve")
##D 
##D z <- fractalcurve(n, which="arrowhead")
##D x <- z$x; y <- z$y
##D plot(x, y, type='l', col="darkgreen")
##D title("Arrowhead Curve")
##D 
##D z <- fractalcurve(n, which="snowflake")
##D x <- z$x; y <- z$y
##D plot(x, y, type='l', col="darkred", lwd=2)
##D title("Snowflake Curve")
##D 
##D par(opar)
## End(Not run)



