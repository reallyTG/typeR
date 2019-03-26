library(spm)


### Name: rfidwcv
### Title: Cross validation, n-fold for the hybrid method of random forest
###   and inverse distance weighting (RFIDW)
### Aliases: rfidwcv

### ** Examples

## Not run: 
##D data(petrel)
##D 
##D rfidwcv1 <- rfidwcv(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 5],
##D predacc = "ALL")
##D rfidwcv1
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D VEcv <- NULL
##D for (i in 1:n) {
##D rfidwcv1 <- rfidwcv(petrel[, c(1,2)], petrel[, c(1,2,6:9)], petrel[, 5],
##D predacc = "VEcv")
##D VEcv [i] <- rfidwcv1
##D }
##D plot(VEcv ~ c(1:n), xlab = "Iteration for RFIDW", ylab = "VEcv (%)")
##D points(cumsum(VEcv) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(VEcv), col = 'blue', lwd = 2)
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D measures <- NULL
##D for (i in 1:n) {
##D rfidwcv1 <- rfidwcv(petrel[, c(1,2)], petrel[, c(1,2,6:9)], petrel[, 5],
##D predacc = "ALL")
##D measures <- rbind(measures, rfidwcv1$vecv)
##D }
##D plot(measures ~ c(1:n), xlab = "Iteration for RFIDW", ylab = "VEcv (%)")
##D points(cumsum(measures) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(measures), col = 'blue', lwd = 2)
## End(Not run)




