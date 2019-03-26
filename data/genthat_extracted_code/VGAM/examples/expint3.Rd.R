library(VGAM)


### Name: expint
### Title: The Exponential Integral and Variants
### Aliases: expint expexpint expint.E1
### Keywords: math

### ** Examples
 ## Not run: 
##D par(mfrow = c(2, 2))
##D curve(expint, 0.01, 2, xlim = c(0, 2), ylim = c(-3, 5),
##D       las = 1, col = "orange")
##D abline(v = (-3):5, h = (-4):5, lwd = 2, lty = "dotted", col = "gray")
##D abline(h = 0, v = 0, lty = "dashed", col = "blue")
##D 
##D curve(expexpint, 0.01, 2, xlim = c(0, 2), ylim = c(-3, 2),
##D       las = 1, col = "orange")
##D abline(v = (-3):2, h = (-4):5, lwd = 2, lty = "dotted", col = "gray")
##D abline(h = 0, v = 0, lty = "dashed", col = "blue")
##D 
##D curve(expint.E1, 0.01, 2, xlim = c(0, 2), ylim = c(0, 5),
##D       las = 1, col = "orange")
##D abline(v = (-3):2, h = (-4):5, lwd = 2, lty = "dotted", col = "gray")
##D abline(h = 0, v = 0, lty = "dashed", col = "blue")
## End(Not run)



