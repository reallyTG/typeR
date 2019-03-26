library(evmix)


### Name: fbckden
### Title: Cross-validation MLE Fitting of Boundary Corrected Kernel
###   Density Estimation Using a Variety of Approaches
### Aliases: fbckden lbckden nlbckden lbckden fbckden nlbckden nlbckden
###   fbckden lbckden

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D nk=500
##D x = rgamma(nk, shape = 1, scale = 2)
##D xx = seq(-1, 10, 0.01)
##D 
##D # cut and normalize is very quick 
##D fit = fbckden(x, linit = 0.2, bcmethod = "cutnorm")
##D hist(x, nk/5, freq = FALSE) 
##D rug(x)
##D lines(xx, dgamma(xx, shape = 1, scale = 2), col = "black")
##D # but cut and normalize does not always work well for boundary correction
##D lines(xx, dbckden(xx, x, lambda = fit$lambda, bcmethod = "cutnorm"), lwd = 2, col = "red")
##D # Handily, the bandwidth usually works well for other approaches as well
##D lines(xx, dbckden(xx, x, lambda = fit$lambda, bcmethod = "simple"), lwd = 2, col = "blue")
##D lines(density(x), lty = 2, lwd = 2, col = "green")
##D legend("topright", c("True Density", "BC KDE using cutnorm",
##D   "BC KDE using simple", "KDE Using density"),
##D   lty = c(1, 1, 1, 2), lwd = c(1, 2, 2, 2), col = c("black", "red", "blue", "green"))
##D 
##D # By contrast simple boundary correction is very slow
##D # a crude trick to speed it up is to ignore the normalisation and non-negative correction,
##D # which generally leads to bandwidth being biased high
##D fit = fbckden(x, linit = 0.2, bcmethod = "simple", proper = FALSE, nn = "none")
##D hist(x, nk/5, freq = FALSE) 
##D rug(x)
##D lines(xx, dgamma(xx, shape = 1, scale = 2), col = "black")
##D lines(xx, dbckden(xx, x, lambda = fit$lambda, bcmethod = "simple"), lwd = 2, col = "blue")
##D lines(density(x), lty = 2, lwd = 2, col = "green")
##D 
##D # but ignoring upper tail in likelihood works a lot better
##D q75 = qgamma(0.75, shape = 1, scale = 2)
##D fitnotail = fbckden(x[x <= q75], linit = 0.1, 
##D    bcmethod = "simple", proper = FALSE, nn = "none", extracentres = x[x > q75])
##D lines(xx, dbckden(xx, x, lambda = fitnotail$lambda, bcmethod = "simple"), lwd = 2, col = "red")
##D legend("topright", c("True Density", "BC KDE using simple", "BC KDE (upper tail ignored)",
##D    "KDE Using density"),
##D    lty = c(1, 1, 1, 2), lwd = c(1, 2, 2, 2), col = c("black", "blue", "red", "green"))
## End(Not run)




