library(VGAM)


### Name: zeta
### Title: Riemann's Zeta Function
### Aliases: zeta
### Keywords: math

### ** Examples

zeta(2:10)

## Not run: 
##D curve(zeta, -13, 0.8, xlim = c(-12, 10), ylim = c(-1, 4), col = "orange",
##D       las = 1, main = expression({zeta}(x)))
##D curve(zeta, 1.2,  12, add = TRUE, col = "orange")
##D abline(v = 0, h = c(0, 1), lty = "dashed", col = "gray")
##D 
##D curve(zeta, -14, -0.4, col = "orange", main = expression({zeta}(x)))
##D abline(v = 0, h = 0, lty = "dashed", col = "gray")  # Close up plot
##D 
##D x <- seq(0.04, 0.8, len = 100)  # Plot of the first derivative
##D plot(x, zeta(x, deriv = 1), type = "l", las = 1, col = "blue",
##D      xlim = c(0.04, 3), ylim = c(-6, 0), main = "zeta'(x)")
##D x <- seq(1.2, 3, len = 100)
##D lines(x, zeta(x, deriv = 1), col = "blue")
##D abline(v = 0, h = 0, lty = "dashed", col = "gray") 
## End(Not run)

zeta(2) - pi^2 / 6     # Should be 0
zeta(4) - pi^4 / 90    # Should be 0
zeta(6) - pi^6 / 945   # Should be 0
zeta(8) - pi^8 / 9450  # Should be 0
# zeta(0, deriv = 1) + 0.5 * log(2*pi)  # Should be 0



