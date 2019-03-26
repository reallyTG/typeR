library(pracma)


### Name: pchip
### Title: Hermitean Interpolation Polynomials
### Aliases: pchip pchipfun
### Keywords: math

### ** Examples

x <- c(1, 2, 3, 4, 5, 6)
y <- c(16, 18, 21, 17, 15, 12)
pchip(x, y, seq(1, 6, by = 0.5))
fp <- pchipfun(x, y)
fp(seq(1, 6, by = 0.5))

## Not run: 
##D plot(x, y, col="red", xlim=c(0,7), ylim=c(10,22),
##D      main = "Spline and 'pchip' Interpolation")
##D grid()
##D 
##D xs <- seq(1, 6, len=51)
##D ys <- interp1(x, y, xs, "spline")
##D lines(xs, ys, col="cyan")
##D yp <- pchip(x, y, xs)
##D lines(xs, yp, col = "magenta")
## End(Not run)



