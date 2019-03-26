library(VGAM)


### Name: Simplex 
### Title: Simplex Distribution
### Aliases: dsimplex rsimplex
### Keywords: distribution

### ** Examples

sigma <- c(4, 2, 1)  # Dispersion parameter
mymu  <- c(0.1, 0.5, 0.7); xxx <- seq(0, 1, len = 501)
## Not run: 
##D  par(mfrow = c(3, 3))  # Figure 2.1 of Song (2007)
##D for (iii in 1:3)
##D   for (jjj in 1:3) {
##D     plot(xxx, dsimplex(xxx, mymu[jjj], sigma[iii]),
##D          type = "l", col = "blue", xlab = "", ylab = "", main =
##D          paste("mu = ", mymu[jjj], ", sigma = ", sigma[iii], sep = "")) } 
## End(Not run)



