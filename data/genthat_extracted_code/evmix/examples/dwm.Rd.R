library(evmix)


### Name: dwm
### Title: Dynamically Weighted Mixture Model
### Aliases: dwm ddwm pdwm qdwm rdwm ddwm dwm pdwm qdwm rdwm pdwm dwm ddwm
###   qdwm rdwm qdwm dwm ddwm pdwm rdwm rdwm dwm ddwm pdwm qdwm

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D xx = seq(0.001, 5, 0.01)
##D f = ddwm(xx, wshape = 2, wscale = 1/gamma(1.5), cmu = 1, ctau = 1, sigmau = 1, xi = 0.5)
##D plot(xx, f, ylim = c(0, 1), xlim = c(0, 5), type = 'l', lwd = 2, 
##D   ylab = "density", main = "Plot example in Frigessi et al. (2002)")
##D lines(xx, dgpd(xx, sigmau = 1, xi = 0.5), col = "red", lty = 2, lwd = 2)
##D lines(xx, dweibull(xx, shape = 2, scale = 1/gamma(1.5)), col = "blue", lty = 2, lwd = 2)
##D legend('topright', c('DWM', 'Weibull', 'GPD'),
##D       col = c("black", "blue", "red"), lty = c(1, 2, 2), lwd = 2)
##D 
##D # three tail behaviours
##D plot(xx, pdwm(xx, xi = 0), type = "l")
##D lines(xx, pdwm(xx, xi = 0.3), col = "red")
##D lines(xx, pdwm(xx, xi = -0.3), col = "blue")
##D legend("bottomright", paste("xi =",c(0, 0.3, -0.3)), col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rdwm(10000, wshape = 2, wscale = 1/gamma(1.5), cmu = 1, ctau = 1, sigmau = 1, xi = 0.1)
##D xx = seq(0, 15, 0.01)
##D hist(x, freq = FALSE, breaks = 100)
##D lines(xx, ddwm(xx, wshape = 2, wscale = 1/gamma(1.5), cmu = 1, ctau = 1, sigmau = 1, xi = 0.1),
##D   lwd = 2, col = 'black')
##D   
##D plot(xx, pdwm(xx, wshape = 2, wscale = 1/gamma(1.5), cmu = 1, ctau = 1, sigmau = 1, xi = 0.1),
##D  xlim = c(0, 15), type = 'l', lwd = 2, 
##D   xlab = "x", ylab = "F(x)")
##D lines(xx, pgpd(xx, sigmau = 1, xi = 0.1), col = "red", lty = 2, lwd = 2)
##D lines(xx, pweibull(xx, shape = 2, scale = 1/gamma(1.5)), col = "blue", lty = 2, lwd = 2)
##D legend('bottomright', c('DWM', 'Weibull', 'GPD'),
##D       col = c("black", "blue", "red"), lty = c(1, 2, 2), lwd = 2)
## End(Not run)




