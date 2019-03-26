library(spm)


### Name: rgokcv
### Title: Cross validation, n-fold for the hybrid method of random forest
###   in ranger and ordinary kriging (RGFOK)
### Aliases: rgokcv

### ** Examples

## Not run: 
##D data(petrel)
##D 
##D rgokcv1 <- rgokcv(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 5],
##D predacc = "ALL")
##D rgokcv1
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D VEcv <- NULL
##D for (i in 1:n) {
##D rgokcv1 <- rgokcv(petrel[, c(1,2)], petrel[, c(1,2,6:9)], petrel[, 5],
##D predacc = "VEcv")
##D VEcv [i] <- rgokcv1
##D }
##D plot(VEcv ~ c(1:n), xlab = "Iteration for RFOK", ylab = "VEcv (%)")
##D points(cumsum(VEcv) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(VEcv), col = 'blue', lwd = 2)
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D measures <- NULL
##D for (i in 1:n) {
##D rgokcv1 <- rgokcv(petrel[, c(1,2)], petrel[, c(1,2,6:9)], petrel[, 5],
##D predacc = "ALL")
##D measures <- rbind(measures, rgokcv1$vecv)
##D }
##D plot(measures ~ c(1:n), xlab = "Iteration for RFOK", ylab = "VEcv (%)")
##D points(cumsum(measures) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(measures), col = 'blue', lwd = 2)
## End(Not run)




