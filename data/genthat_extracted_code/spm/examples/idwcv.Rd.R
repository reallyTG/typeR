library(spm)


### Name: idwcv
### Title: Cross validation, n-fold for inverse distance weighting (IDW)
### Aliases: idwcv

### ** Examples

## Not run: 
##D library(sp)
##D data(swmud)
##D data(petrel)
##D 
##D idwcv1 <- idwcv(swmud[, c(1,2)], swmud[, 3], nmax = 12, idp = 2)
##D idwcv1
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D VEcv <- NULL
##D for (i in 1:n) {
##D idwcv1 <- idwcv(petrel[, c(1,2)], petrel[, 3], nmax = 12, predacc = "VEcv")
##D VEcv [i] <- idwcv1
##D }
##D plot(VEcv ~ c(1:n), xlab = "Iteration for IDW", ylab = "VEcv (%)")
##D points(cumsum(VEcv) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(VEcv), col = 'blue', lwd=2)
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D measures <- NULL
##D for (i in 1:n) {
##D idwcv1 <- idwcv(swmud[, c(1,2)], swmud[, 3], predacc = "ALL")
##D measures <- rbind(measures, idwcv1$vecv)
##D }
##D plot(measures ~ c(1:n), xlab = "Iteration for IDW", ylab="VEcv (%)")
##D points(cumsum(measures) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(measures), col = 'blue', lwd = 2)
## End(Not run)




