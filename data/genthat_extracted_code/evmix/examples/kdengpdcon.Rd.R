library(evmix)


### Name: kdengpdcon
### Title: Kernel Density Estimate and GPD Tail Extreme Value Mixture Model
###   With Single Continuity Constraint
### Aliases: kdengpdcon dkdengpdcon pkdengpdcon qkdengpdcon rkdengpdcon
###   dkdengpdcon kdengpdcon pkdengpdcon qkdengpdcon rkdengpdcon
###   pkdengpdcon kdengpdcon dkdengpdcon qkdengpdcon rkdengpdcon
###   qkdengpdcon kdengpdcon dkdengpdcon pkdengpdcon rkdengpdcon
###   rkdengpdcon kdengpdcon dkdengpdcon pkdengpdcon qkdengpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D kerncentres=rnorm(500, 0, 1)
##D xx = seq(-4, 4, 0.01)
##D hist(kerncentres, breaks = 100, freq = FALSE)
##D lines(xx, dkdengpdcon(xx, kerncentres, u = 1.2, xi = 0.1))
##D 
##D plot(xx, pkdengpdcon(xx, kerncentres), type = "l")
##D lines(xx, pkdengpdcon(xx, kerncentres, xi = 0.3), col = "red")
##D lines(xx, pkdengpdcon(xx, kerncentres, xi = -0.3), col = "blue")
##D legend("topleft", paste("xi =",c(0, 0.3, -0.3)),
##D       col=c("black", "red", "blue"), lty = 1, cex = 0.5)
##D 
##D x = rkdengpdcon(1000, kerncentres, phiu = 0.2, u = 1, xi = 0.2)
##D xx = seq(-4, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 6))
##D lines(xx, dkdengpdcon(xx, kerncentres, phiu = 0.2, u = 1, xi = -0.1))
##D 
##D plot(xx, dkdengpdcon(xx, kerncentres, xi=0, u = 1, phiu = 0.2), type = "l")
##D lines(xx, dkdengpdcon(xx, kerncentres, xi=0.2, u = 1, phiu = 0.2), col = "red")
##D lines(xx, dkdengpdcon(xx, kerncentres, xi=-0.2, u = 1, phiu = 0.2), col = "blue")
##D legend("topleft", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D       col=c("black", "red", "blue"), lty = 1)
## End(Not run)




