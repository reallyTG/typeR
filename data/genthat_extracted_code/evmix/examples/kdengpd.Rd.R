library(evmix)


### Name: kdengpd
### Title: Kernel Density Estimate and GPD Tail Extreme Value Mixture Model
### Aliases: kdengpd dkdengpd pkdengpd qkdengpd rkdengpd dkdengpd kdengpd
###   pkdengpd qkdengpd rkdengpd pkdengpd kdengpd dkdengpd qkdengpd
###   rkdengpd qkdengpd kdengpd dkdengpd pkdengpd rkdengpd rkdengpd kdengpd
###   dkdengpd pkdengpd qkdengpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D kerncentres=rnorm(500, 0, 1)
##D xx = seq(-4, 4, 0.01)
##D hist(kerncentres, breaks = 100, freq = FALSE)
##D lines(xx, dkdengpd(xx, kerncentres, u = 1.2, sigmau = 0.56, xi = 0.1))
##D 
##D plot(xx, pkdengpd(xx, kerncentres), type = "l")
##D lines(xx, pkdengpd(xx, kerncentres, xi = 0.3), col = "red")
##D lines(xx, pkdengpd(xx, kerncentres, xi = -0.3), col = "blue")
##D legend("topleft", paste("xi =",c(0, 0.3, -0.3)),
##D       col=c("black", "red", "blue"), lty = 1, cex = 0.5)
##D 
##D x = rkdengpd(1000, kerncentres, phiu = 0.1, u = 1.2, sigmau = 0.56, xi = 0.1)
##D xx = seq(-4, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 6))
##D lines(xx, dkdengpd(xx, kerncentres, phiu = 0.1, u = 1.2, sigmau = 0.56, xi = 0.1))
##D 
##D plot(xx, dkdengpd(xx, kerncentres, xi=0, phiu = 0.1), type = "l")
##D lines(xx, dkdengpd(xx, kerncentres, xi=0.2, phiu = 0.1), col = "red")
##D lines(xx, dkdengpd(xx, kerncentres, xi=-0.2, phiu = 0.1), col = "blue")
##D legend("topleft", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D       col=c("black", "red", "blue"), lty = 1)
## End(Not run)




