library(VGAM)


### Name: Bistudentt
### Title: Bivariate Student-t Distribution Cumulative Distribution
###   Function
### Aliases: Bistudentt dbistudentt
### Keywords: distribution

### ** Examples

## Not run: 
##D  N <- 101; x <- seq(-4, 4, len = N); Rho <- 0.7; mydf <- 10
##D ox <- expand.grid(x, x)
##D zedd <- dbistudentt(ox[, 1], ox[, 2], df = mydf, rho = Rho, log = TRUE)
##D contour(x, x, matrix(zedd, N, N), col = "blue", labcex = 1.5)
## End(Not run)



