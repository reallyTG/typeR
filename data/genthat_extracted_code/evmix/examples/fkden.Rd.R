library(evmix)


### Name: fkden
### Title: Cross-validation MLE Fitting of Kernel Density Estimator, With
###   Variety of Kernels
### Aliases: fkden lkden nlkden lkden fkden nlkden nlkden fkden lkden

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D nk=50
##D x = rnorm(nk)
##D xx = seq(-5, 5, 0.01)
##D fit = fkden(x)
##D hist(x, nk/5, freq = FALSE, xlim = c(-5, 5), ylim = c(0,0.6)) 
##D rug(x)
##D for (i in 1:nk) lines(xx, dnorm(xx, x[i], sd = fit$lambda)*0.05)
##D lines(xx,dnorm(xx), col = "black")
##D lines(xx, dkden(xx, x, lambda = fit$lambda), lwd = 2, col = "red")
##D lines(density(x), lty = 2, lwd = 2, col = "green")
##D lines(density(x, bw = fit$bw), lwd = 2, lty = 2,  col = "blue")
##D legend("topright", c("True Density", "KDE fitted evmix",
##D "KDE Using density, default bandwidth", "KDE Using density, c-v likelihood bandwidth"),
##D lty = c(1, 1, 2, 2), lwd = c(1, 2, 2, 2), col = c("black", "red", "green", "blue"))
##D 
##D par(mfrow = c(2, 1))
##D 
##D # bandwidth is biased towards oversmoothing for heavy tails
##D nk=100
##D x = rt(nk, df = 2)
##D xx = seq(-8, 8, 0.01)
##D fit = fkden(x)
##D hist(x, seq(floor(min(x)), ceiling(max(x)), 0.5), freq = FALSE, xlim = c(-8, 10)) 
##D rug(x)
##D for (i in 1:nk) lines(xx, dnorm(xx, x[i], sd = fit$lambda)*0.05)
##D lines(xx,dt(xx , df = 2), col = "black")
##D lines(xx, dkden(xx, x, lambda = fit$lambda), lwd = 2, col = "red")
##D legend("topright", c("True Density", "KDE fitted evmix, c-v likelihood bandwidth"),
##D lty = c(1, 1), lwd = c(1, 2), col = c("black", "red"))
##D 
##D # remove heavy tails from cv-likelihood evaluation, but still include them in KDE within likelihood
##D # often gives better bandwidth (see MacDonald et al (2011) for justification)
##D nk=100
##D x = rt(nk, df = 2)
##D xx = seq(-8, 8, 0.01)
##D fit2 = fkden(x[(x > -4) & (x < 4)], extracentres = x[(x <= -4) | (x >= 4)])
##D hist(x, seq(floor(min(x)), ceiling(max(x)), 0.5), freq = FALSE, xlim = c(-8, 10)) 
##D rug(x)
##D for (i in 1:nk) lines(xx, dnorm(xx, x[i], sd = fit2$lambda)*0.05)
##D lines(xx,dt(xx , df = 2), col = "black")
##D lines(xx, dkden(xx, x, lambda = fit2$lambda), lwd = 2, col = "red")
##D lines(xx, dkden(xx, x, lambda = fit$lambda), lwd = 2, col = "blue")
##D legend("topright", c("True Density", "KDE fitted evmix, tails removed",
##D "KDE fitted evmix, tails included"),
##D lty = c(1, 1, 1), lwd = c(1, 2, 2), col = c("black", "red", "blue"))
## End(Not run)




