library(evmix)


### Name: bckdengpd
### Title: Boundary Corrected Kernel Density Estimate and GPD Tail Extreme
###   Value Mixture Model
### Aliases: bckdengpd dbckdengpd pbckdengpd qbckdengpd rbckdengpd
###   dbckdengpd bckdengpd pbckdengpd qbckdengpd rbckdengpd pbckdengpd
###   bckdengpd dbckdengpd qbckdengpd rbckdengpd qbckdengpd bckdengpd
###   dbckdengpd pbckdengpd rbckdengpd rbckdengpd bckdengpd dbckdengpd
###   pbckdengpd qbckdengpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D kerncentres=rgamma(500, shape = 1, scale = 2)
##D xx = seq(-0.1, 10, 0.01)
##D hist(kerncentres, breaks = 100, freq = FALSE)
##D lines(xx, dbckdengpd(xx, kerncentres, lambda = 0.5, bcmethod = "reflect"),
##D xlab = "x", ylab = "f(x)")
##D abline(v = quantile(kerncentres, 0.9))
##D 
##D plot(xx, pbckdengpd(xx, kerncentres, lambda = 0.5, bcmethod = "reflect"),
##D xlab = "x", ylab = "F(x)", type = "l")
##D lines(xx, pbckdengpd(xx, kerncentres, lambda = 0.5, xi = 0.3, bcmethod = "reflect"),
##D xlab = "x", ylab = "F(x)", col = "red")
##D lines(xx, pbckdengpd(xx, kerncentres, lambda = 0.5, xi = -0.3, bcmethod = "reflect"),
##D xlab = "x", ylab = "F(x)", col = "blue")
##D legend("topleft", paste("xi =",c(0, 0.3, -0.3)),
##D       col=c("black", "red", "blue"), lty = 1, cex = 0.5)
##D 
##D kerncentres = rweibull(1000, 2, 1)
##D x = rbckdengpd(1000, kerncentres, lambda = 0.1, phiu = TRUE, bcmethod = "reflect")
##D xx = seq(0.01, 3.5, 0.01)
##D hist(x, breaks = 100, freq = FALSE)         
##D lines(xx, dbckdengpd(xx, kerncentres, lambda = 0.1, phiu = TRUE, bcmethod = "reflect"),
##D xlab = "x", ylab = "f(x)")
##D 
##D lines(xx, dbckdengpd(xx, kerncentres, lambda = 0.1, xi=-0.2, phiu = 0.1, bcmethod = "reflect"),
##D xlab = "x", ylab = "f(x)", col = "red")
##D lines(xx, dbckdengpd(xx, kerncentres, lambda = 0.1, xi=0.2, phiu = 0.1, bcmethod = "reflect"),
##D xlab = "x", ylab = "f(x)", col = "blue")
##D legend("topleft", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D       col=c("black", "red", "blue"), lty = 1)
## End(Not run)




