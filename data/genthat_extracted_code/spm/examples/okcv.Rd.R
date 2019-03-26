library(spm)


### Name: okcv
### Title: Cross validation, n-fold for ordinary kriging (OK)
### Aliases: okcv

### ** Examples

## Not run: 
##D library(sp)
##D data(swmud)
##D data(petrel)
##D 
##D okcv1 <- okcv(swmud[, c(1,2)], swmud[, 3], nmax = 7, transformation =
##D "arcsine", vgm.args = ("Sph"), predacc = "VEcv")
##D okcv1
##D 
##D n <- 20 # number of iterations,60 to 100 is recommended.
##D VEcv <- NULL
##D for (i in 1:n) {
##D okcv1 <- okcv(petrel[, c(1,2)], petrel[, 5], nmax = 12,
##D transformation = "arcsine", predacc = "VEcv")
##D VEcv [i] <- okcv1
##D }
##D plot(VEcv ~ c(1:n), xlab = "Iteration for OK", ylab = "VEcv (%)")
##D points(cumsum(VEcv) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(VEcv), col = 'blue', lwd = 2)
##D 
##D n <- 20 # number of iterations, 60 to 100 is recommended.
##D measures <- NULL
##D for (i in 1:n) {
##D okcv1 <- okcv(petrel[, c(1,2)], petrel[, 3], nmax = 12, transformation =
##D "arcsine", predacc = "ALL")
##D measures <- rbind(measures, okcv1$vecv)
##D }
##D plot(measures ~ c(1:n), xlab = "Iteration for OK", ylab = "VEcv (%)")
##D points(cumsum(measures) / c(1:n) ~ c(1:n), col = 2)
##D abline(h = mean(measures), col = 'blue', lwd = 2)
## End(Not run)




