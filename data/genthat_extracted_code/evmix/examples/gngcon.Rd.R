library(evmix)


### Name: gngcon
### Title: Normal Bulk with GPD Upper and Lower Tails Extreme Value Mixture
###   Model with Single Continuity Constraint at Thresholds
### Aliases: gngcon dgngcon pgngcon qgngcon rgngcon dgngcon gngcon pgngcon
###   qgngcon rgngcon pgngcon gngcon dgngcon qgngcon rgngcon qgngcon gngcon
###   dgngcon pgngcon rgngcon rgngcon gngcon dgngcon pgngcon qgngcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D x = rgngcon(1000, phiul = 0.15, phiur = 0.15)
##D xx = seq(-6, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-6, 6))
##D lines(xx, dgngcon(xx, phiul = 0.15, phiur = 0.15))
##D 
##D # three tail behaviours
##D plot(xx, pgngcon(xx), type = "l")
##D lines(xx, pgngcon(xx, xil = 0.3, xir = 0.3), col = "red")
##D lines(xx, pgngcon(xx, xil = -0.3, xir = -0.3), col = "blue")
##D legend("topleft", paste("Symmetric xil=xir=",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rgngcon(1000, xil = -0.3, phiul = 0.2, xir = 0.3, phiur = 0.2)
##D xx = seq(-6, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-6, 6))
##D lines(xx, dgngcon(xx, xil = -0.3, phiul = 0.2, xir = 0.3, phiur = 0.2))
##D 
##D plot(xx, dgngcon(xx, xil = -0.3, phiul = 0.2, xir = 0.3, phiur = 0.2), type = "l", ylim = c(0, 0.4))
##D lines(xx, dgngcon(xx, xil = -0.3, phiul = 0.3, xir = 0.3, phiur = 0.3), col = "red")
##D lines(xx, dgngcon(xx, xil = -0.3, phiul = TRUE, xir = 0.3, phiur = TRUE), col = "blue")
##D legend("topleft", c("phiul = phiur = 0.2", "phiul = phiur = 0.3", "Bulk Tail Fraction"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




