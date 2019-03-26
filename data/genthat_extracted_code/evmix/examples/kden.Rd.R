library(evmix)


### Name: kden
### Title: Kernel Density Estimation, With Variety of Kernels
### Aliases: kden dkden pkden qkden rkden dkden kden pkden qkden rkden
###   pkden kden dkden qkden rkden qkden kden dkden pkden rkden rkden kden
###   dkden pkden qkden

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D nk=50
##D x = rnorm(nk)
##D xx = seq(-5, 5, 0.01)
##D plot(xx, dnorm(xx))
##D rug(x)
##D for (i in 1:nk) lines(xx, dnorm(xx, x[i], sd = bw.nrd0(x))*0.05)
##D lines(xx, dkden(xx, x), lwd = 2, col = "red")
##D lines(density(x), lty = 2, lwd = 2, col = "green")
##D legend("topright", c("True Density", "KDE Using evmix", "KDE Using density function"),
##D lty = c(1, 1, 2), lwd = c(1, 2, 2), col = c("black", "red", "green"))
##D 
##D # Estimate bandwidth using cross-validation likelihood
##D x = rnorm(nk)
##D fit = fkden(x)
##D hist(x, nk/5, freq = FALSE, xlim = c(-5, 5), ylim = c(0, 0.6)) 
##D rug(x)
##D for (i in 1:nk) lines(xx, dnorm(xx, x[i], sd = fit$bw)*0.05)
##D lines(xx,dnorm(xx), col = "black")
##D lines(xx, dkden(xx, x, lambda = fit$lambda), lwd = 2, col = "red")
##D lines(density(x), lty = 2, lwd = 2, col = "green")
##D lines(density(x, bw = fit$bw), lwd = 2, lty = 2,  col = "blue")
##D legend("topright", c("True Density", "KDE fitted evmix",
##D "KDE Using density, default bandwidth", "KDE Using density, c-v likelihood bandwidth"),
##D lty = c(1, 1, 2, 2), lwd = c(1, 2, 2, 2), col = c("black", "red", "green", "blue"))
##D 
##D plot(xx, pnorm(xx), type = "l")
##D rug(x)
##D lines(xx, pkden(xx, x), lwd = 2, col = "red")
##D lines(xx, pkden(xx, x, lambda = fit$lambda), lwd = 2, col = "green")
##D # green and blue (quantile) function should be same
##D p = seq(0, 1, 0.001)
##D lines(qkden(p, x, lambda = fit$lambda), p, lwd = 2, lty = 2, col = "blue") 
##D legend("topleft", c("True Density", "KDE using evmix, normal reference rule",
##D "KDE using evmix, c-v likelihood","KDE quantile function, c-v likelihood"),
##D lty = c(1, 1, 1, 2), lwd = c(1, 2, 2, 2), col = c("black", "red", "green", "blue"))
##D 
##D xnew = rkden(10000, x, lambda = fit$lambda)
##D hist(xnew, breaks = 100, freq = FALSE, xlim = c(-5, 5))
##D rug(xnew)
##D lines(xx,dnorm(xx), col = "black")
##D lines(xx, dkden(xx, x), lwd = 2, col = "red")
##D legend("topright", c("True Density", "KDE Using evmix"),
##D lty = c(1, 2), lwd = c(1, 2), col = c("black", "red"))
## End(Not run)




