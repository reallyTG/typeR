library(adagio)


### Name: SIAM test functions
### Title: Trefethen and Wagon Test Functions
### Aliases: fnTrefethen fnWagon
### Keywords: testfunctions

### ** Examples

  x <- 2*runif(5) - 1
  fnTrefethen(x)
  fnWagon(x)

  ## Not run: 
##D   T <- matrix(NA, nrow=1001, ncol=1001)
##D   for (i in 1:1001) {
##D     for (j in 1:1001) {
##D         T[i, j] <- fnTrefethen(c(x[i], y[j]))
##D     }
##D   }
##D   image(x, y, T)
##D   contour(x, y, T, add=TRUE)
##D   
## End(Not run)



