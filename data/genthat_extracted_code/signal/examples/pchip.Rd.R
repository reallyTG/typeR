library(signal)


### Name: pchip
### Title: Piecewise cubic hermite interpolation
### Aliases: pchip
### Keywords: math

### ** Examples

xf <- seq(0, 11, length=500)
yf <- sin(2*pi*xf/5)
xp <- c(0:10)
yp <- sin(2*pi*xp/5)
pch  <- pchip(xp, yp, xf)
plot(xp, yp, xlim = c(0, 11))
lines(xf, pch, col = "orange")



