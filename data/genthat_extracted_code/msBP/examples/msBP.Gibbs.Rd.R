library(msBP)


### Name: msBP.Gibbs
### Title: Gibbs sampling for density estimation for msBP model
### Aliases: msBP.Gibbs

### ** Examples

## Not run: 
##D data(galaxy)
##D galaxy <- data.frame(galaxy)
##D speeds <- galaxy$speed/1000
##D set.seed(1)
##D #with fixed g0 and random a, b
##D fit.msbp.1 <- msBP.Gibbs(speeds, a = 10, b = 5, g0 = "empirical", 
##D 	mcmc=list(nrep = 10000, nb = 5000, ndisplay = 1000), 
##D 	hyper=list(hyperprior=list(a = TRUE, b = TRUE, g0 = FALSE), 
##D 	hyperpar=list(beta=5,gamma = 1,delta = 1,lambda = 1)), 
##D 	printing = 0, maxS = 7, grid = list(n.points = 150, low = 5, upp = 38))
##D 
##D #with random a, b and hyperparameters of g0
##D fit.msbp.2 <- msBP.Gibbs(speeds, a = 10, b=5, g0 = "normal", 
##D 	mcmc=list(nrep = 10000, nb = 5000, ndisplay = 1000), 
##D 	hyper=list(hyperprior = list(a = TRUE, b = TRUE, g0 = TRUE), 
##D   hyperpar = list(beta = 50, gamma = 5, delta = 10, lambda = 1,
##D 	gridB = seq(0, 20, length = 30),
##D 	mu0 = 21, kappa0 = 0.1, alpha0 = 1, beta0 = 20)), 
##D 	printing = 0, maxS = 7, grid = list(n.points = 150, lo w= 5, upp = 38))	
##D 
##D hist(speeds, prob=TRUE,br=10, ylim=c(0,0.23), main="", col='grey')
##D points(fit.msbp.1$density$postMeanDens~fit.msbp.1$density$xDens, ty='l', lwd=2)
##D points(fit.msbp.1$density$postUppDens~fit.msbp.1$density$xDens, ty='l',lty=2, lwd=2)
##D points(fit.msbp.1$density$postLowDens~fit.msbp.1$density$xDens, ty='l',lty=2, lwd=2)
##D 
##D hist(speeds, prob=TRUE,br=10, ylim=c(0,0.23), main="", col='grey')
##D points(fit.msbp.2$density$postMeanDens~fit.msbp.2$density$xDens, ty='l', lwd=2)
##D points(fit.msbp.2$density$postUppDens~fit.msbp.2$density$xDens, ty='l',lty=2, lwd=2)
##D points(fit.msbp.2$density$postLowDens~fit.msbp.2$density$xDens, ty='l',lty=2, lwd=2)
##D 
## End(Not run)



