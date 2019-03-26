library(VGAM)


### Name: bilogis
### Title: Bivariate Logistic Distribution
### Aliases: bilogis dbilogis pbilogis rbilogis
### Keywords: distribution

### ** Examples

## Not run: 
##D  par(mfrow = c(1, 3))
##D ymat <- rbilogis(n = 2000, loc1 = 5, loc2 = 7, scale2 = exp(1))
##D myxlim <- c(-2, 15); myylim <- c(-10, 30)
##D plot(ymat, xlim = myxlim, ylim = myylim)
##D 
##D N <- 100
##D x1 <- seq(myxlim[1], myxlim[2], len = N)
##D x2 <- seq(myylim[1], myylim[2], len = N)
##D ox <- expand.grid(x1, x2)
##D z <- dbilogis(ox[,1], ox[,2], loc1 = 5, loc2 = 7, scale2 = exp(1))
##D contour(x1, x2, matrix(z, N, N), main = "density")
##D z <- pbilogis(ox[,1], ox[,2], loc1 = 5, loc2 = 7, scale2 = exp(1))
##D contour(x1, x2, matrix(z, N, N), main = "cdf") 
## End(Not run)



