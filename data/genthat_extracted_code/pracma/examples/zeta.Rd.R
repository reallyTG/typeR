library(pracma)


### Name: zeta
### Title: Riemann Zeta Function
### Aliases: zeta
### Keywords: specfun

### ** Examples

##  First zero on the critical line s = 0.5 + i t
## Not run: 
##D x <- seq(0, 20, len=1001)
##D z <- 0.5 + x*1i
##D fr <- Re(zeta(z))
##D fi <- Im(zeta(z))
##D fa <- abs(zeta(z))
##D plot(x, fa, type="n", xlim = c(0, 20), ylim = c(-1.5, 2.5),
##D      xlab = "Imaginary part (on critical line)", ylab = "Function value",
##D      main = "Riemann's Zeta Function along the critical line")
##D lines(x, fr, col="blue")
##D lines(x, fi, col="darkgreen")
##D lines(x, fa, col = "red", lwd = 2)
##D points(14.1347, 0, col = "darkred")
##D legend(0, 2.4, c("real part", "imaginary part", "absolute value"),
##D        lty = 1, lwd = c(1, 1, 2), col = c("blue", "darkgreen", "red"))
##D grid()
## End(Not run)



