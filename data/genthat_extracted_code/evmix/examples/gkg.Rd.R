library(evmix)


### Name: gkg
### Title: Kernel Density Estimate and GPD Both Upper and Lower Tails
###   Extreme Value Mixture Model
### Aliases: gkg dgkg pgkg qgkg rgkg dgkg gkg pgkg qgkg rgkg pgkg gkg dgkg
###   qgkg rgkg qgkg gkg dgkg pgkg rgkg rgkg gkg dgkg pgkg qgkg

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D kerncentres=rnorm(1000,0,1)
##D x = rgkg(1000, kerncentres, phiul = 0.15, phiur = 0.15)
##D xx = seq(-6, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-6, 6))
##D lines(xx, dgkg(xx, kerncentres, phiul = 0.15, phiur = 0.15))
##D 
##D # three tail behaviours
##D plot(xx, pgkg(xx, kerncentres), type = "l")
##D lines(xx, pgkg(xx, kerncentres,xil = 0.3, xir = 0.3), col = "red")
##D lines(xx, pgkg(xx, kerncentres,xil = -0.3, xir = -0.3), col = "blue")
##D legend("topleft", paste("Symmetric xil=xir=",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D # asymmetric tail behaviours
##D x = rgkg(1000, kerncentres, xil = -0.3, phiul = 0.1, xir = 0.3, phiur = 0.1)
##D xx = seq(-6, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-6, 6))
##D lines(xx, dgkg(xx, kerncentres, xil = -0.3, phiul = 0.1, xir = 0.3, phiur = 0.1))
##D 
##D plot(xx, dgkg(xx, kerncentres, xil = -0.3, phiul = 0.2, xir = 0.3, phiur = 0.2),
##D   type = "l", ylim = c(0, 0.4))
##D lines(xx, dgkg(xx, kerncentres, xil = -0.3, phiul = 0.3, xir = 0.3, phiur = 0.3),
##D   col = "red")
##D lines(xx, dgkg(xx, kerncentres, xil = -0.3, phiul = TRUE, xir = 0.3, phiur = TRUE),
##D   col = "blue")
##D legend("topleft", c("phiul = phiur = 0.2", "phiul = phiur = 0.3", "Bulk Tail Fraction"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




