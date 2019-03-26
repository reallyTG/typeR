library(signal)


### Name: interp1
### Title: Interpolation
### Aliases: interp1
### Keywords: math

### ** Examples

xf <- seq(0, 11, length=500)
yf <- sin(2*pi*xf/5)
#xp <- c(0:1,3:10)
#yp <- sin(2*pi*xp/5)
xp <- c(0:10)
yp <- sin(2*pi*xp/5)
extrap <- TRUE
lin  <- interp1(xp, yp, xf, 'linear', extrap = extrap)
spl  <- interp1(xp, yp, xf, 'spline', extrap = extrap)
pch  <- interp1(xp, yp, xf, 'pchip', extrap = extrap)
cub  <- interp1(xp, yp, xf, 'cubic', extrap = extrap)
near <- interp1(xp, yp, xf, 'nearest', extrap = extrap)
plot(xp, yp, xlim = c(0, 11))
lines(xf, lin, col = "red")
lines(xf, spl, col = "green")
lines(xf, pch, col = "orange")
lines(xf, cub, col = "blue")
lines(xf, near, col = "purple")



