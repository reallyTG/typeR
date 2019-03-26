library(evmix)


### Name: bckden
### Title: Boundary Corrected Kernel Density Estimation Using a Variety of
###   Approaches
### Aliases: bckden dbckden pbckden qbckden rbckden dbckden bckden pbckden
###   qbckden rbckden pbckden bckden dbckden qbckden rbckden qbckden bckden
###   dbckden pbckden rbckden rbckden bckden dbckden pbckden qbckden

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D n=100
##D x = rgamma(n, shape = 1, scale = 2)
##D xx = seq(-0.5, 12, 0.01)
##D plot(xx, dgamma(xx, shape = 1, scale = 2), type = "l")
##D rug(x)
##D lines(xx, dbckden(xx, x, lambda = 1), lwd = 2, col = "red")
##D lines(density(x), lty = 2, lwd = 2, col = "green")
##D legend("topright", c("True Density", "Simple boundary correction",
##D "KDE using density function", "Boundary Corrected Kernels"),
##D lty = c(1, 1, 2, 1), lwd = c(1, 2, 2, 1), col = c("black", "red", "green", "blue"))
##D 
##D n=100
##D x = rbeta(n, shape1 = 3, shape2 = 2)*5
##D xx = seq(-0.5, 5.5, 0.01)
##D plot(xx, dbeta(xx/5, shape1 = 3, shape2 = 2)/5, type = "l", ylim = c(0, 0.8))
##D rug(x)
##D lines(xx, dbckden(xx, x, lambda = 0.1, bcmethod = "beta2", proper = TRUE, xmax = 5),
##D   lwd = 2, col = "red")
##D lines(density(x), lty = 2, lwd = 2, col = "green")
##D legend("topright", c("True Density", "Modified Beta KDE Using evmix",
##D   "KDE using density function"),
##D lty = c(1, 1, 2), lwd = c(1, 2, 2), col = c("black", "red", "green"))
##D 
##D # Demonstrate renormalisation (usually small difference)
##D n=1000
##D x = rgamma(n, shape = 1, scale = 2)
##D xx = seq(-0.5, 15, 0.01)
##D plot(xx, dgamma(xx, shape = 1, scale = 2), type = "l")
##D rug(x)
##D lines(xx, dbckden(xx, x, lambda = 0.5, bcmethod = "simple", proper = TRUE),
##D   lwd = 2, col = "purple")
##D lines(xx, dbckden(xx, x, lambda = 0.5, bcmethod = "simple", proper = FALSE),
##D   lwd = 2, col = "red", lty = 2)
##D legend("topright", c("True Density", "Simple BC with renomalisation", 
##D "Simple BC without renomalisation"),
##D lty = 1, lwd = c(1, 2, 2), col = c("black", "purple", "red"))
## End(Not run)




