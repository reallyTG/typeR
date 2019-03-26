library(VGAM)


### Name: Biclaytoncop
### Title: Clayton Copula (Bivariate) Distribution
### Aliases: dbiclaytoncop rbiclaytoncop
### Keywords: distribution

### ** Examples

## Not run: 
##D  edge <- 0.01  # A small positive value
##D N <- 101; x <- seq(edge, 1.0 - edge, len = N); Rho <- 0.7
##D ox <- expand.grid(x, x)
##D zedd <- dbiclaytoncop(ox[, 1], ox[, 2], apar = Rho, log = TRUE)
##D par(mfrow = c(1, 2))
##D contour(x, x, matrix(zedd, N, N), col = "blue", labcex = 1.5, las = 1)
##D plot(rbiclaytoncop(1000, 2), col = "blue", las = 1)
## End(Not run)



