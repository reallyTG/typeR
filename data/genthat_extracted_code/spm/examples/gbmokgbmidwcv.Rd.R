library(spm)


### Name: gbmokgbmidwcv
### Title: Cross validation, n-fold for the average of the hybrid method of
###   generalized boosted regression modeling and ordinary kriging and the
###   hybrid method of generalized boosted regression modeling and inverse
###   distance weighting (gbmokgbmidw)
### Aliases: gbmokgbmidwcv

### ** Examples

## Not run: 
##D data(sponge)
##D 
##D gbmokgbmidw1 <- gbmokgbmidwcv(sponge[, c(1,2)], sponge[, -c(3)], sponge[, 3],
##D cv.fold = 10, family = "poisson", n.cores=2, predacc = "ALL")
##D gbmokgbmidw1
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D VEcv <- NULL
##D for (i in 1:n) {
##D gbmokgbmidw1 <- gbmokgbmidwcv(sponge[, c(1,2)], sponge[, -c(3)], sponge[, 3],
##D cv.fold = 10, family = "poisson", n.cores=2, predacc = "VEcv")
##D VEcv [i] <- gbmokgbmidw1
##D }
##D plot(VEcv ~ c(1:n), xlab = "Iteration for gbmokgbmidw", ylab = "VEcv (%)")
##D points(cumsum(VEcv) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(VEcv), col = 'blue', lwd = 2)
## End(Not run)




