library(spm)


### Name: RFcv
### Title: Cross validation, n-fold for random forest (RF)
### Aliases: RFcv

### ** Examples

## Not run: 
##D data(hard)
##D data(petrel)
##D 
##D rfcv1 <- RFcv(petrel[, c(1,2, 6:9)], petrel[, 5], predacc = "ALL")
##D rfcv1
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D VEcv <- NULL
##D for (i in 1:n) {
##D rfcv1 <- RFcv(petrel[, c(1,2,6:9)], petrel[, 5], predacc = "VEcv")
##D VEcv [i] <- rfcv1
##D }
##D plot(VEcv ~ c(1:n), xlab = "Iteration for RF", ylab = "VEcv (%)")
##D points(cumsum(VEcv) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(VEcv), col = 'blue', lwd = 2)
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D measures <- NULL
##D for (i in 1:n) {
##D rfcv1 <- RFcv(hard[, c(4:6)], hard[, 17])
##D measures <- rbind(measures, rfcv1$ccr) # for kappa, replace ccr.cv with kappa.cv
##D }
##D plot(measures ~ c(1:n), xlab = "Iteration for RF", ylab = "Correct
##D classification rate  (%)")
##D points(cumsum(measures) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(measures), col = 'blue', lwd = 2)
## End(Not run)




