library(pracma)


### Name: trigApprox
### Title: Trigonometric Approximation
### Aliases: trigApprox
### Keywords: math

### ** Examples

## Not run: 
##D ##  Example: Gauss' Pallas data (1801)
##D asc <- seq(0, 330, by = 30)
##D dec <- c(408, 89, -66, 10, 338, 807, 1238, 1511, 1583, 1462, 1183, 804)
##D plot(2*pi*asc/360, dec, pch = "+", col = "red", xlim = c(0, 2*pi), ylim = c(-500, 2000),
##D      xlab = "Ascension [radians]", ylab = "Declination [minutes]",
##D      main = "Gauss' Pallas Data")
##D grid()
##D points(2*pi*asc/360, dec, pch = "o", col = "red")
##D ts <- seq(0, 2*pi, len = 100)
##D xs <- trigApprox(ts ,dec, 1)
##D lines(ts, xs, col = "black")
##D xs <- trigApprox(ts ,dec, 2)
##D lines(ts, xs, col = "blue")
##D legend(3, 0, c("Trig. Regression of degree 1", "Trig. Regression of degree 2",
##D                   "Astronomical position"), col = c("black", "blue", "red"),
##D                 lty = c(1,1,0), pch = c("", "", "+"))
## End(Not run)



