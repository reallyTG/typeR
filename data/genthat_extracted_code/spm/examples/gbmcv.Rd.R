library(spm)


### Name: gbmcv
### Title: Cross validation, n-fold for generalized boosted regression
###   modeling (gbm)
### Aliases: gbmcv

### ** Examples

## Not run: 
##D data(sponge)
##D 
##D gbmcv1 <- gbmcv(sponge[, -c(3)], sponge[, 3], cv.fold = 10,
##D family = "poisson", n.cores=2, predacc = "ALL")
##D gbmcv1
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D VEcv <- NULL
##D for (i in 1:n) {
##D gbmcv1 <- gbmcv(sponge[, -c(3)], sponge[, 3], cv.fold = 10,
##D family = "poisson",  n.cores=2, predacc = "VEcv")
##D VEcv [i] <- gbmcv1
##D }
##D plot(VEcv ~ c(1:n), xlab = "Iteration for gbm", ylab = "VEcv (%)")
##D points(cumsum(VEcv) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(VEcv), col = 'blue', lwd = 2)
## End(Not run)




