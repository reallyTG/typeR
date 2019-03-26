library(VGAM)


### Name: yeo.johnson
### Title: Yeo-Johnson Transformation
### Aliases: yeo.johnson
### Keywords: models regression

### ** Examples

y <- seq(-4, 4, len = (nn <- 200))
ltry <- c(0, 0.5, 1, 1.5, 2)  # Try these values of lambda
lltry <- length(ltry)
psi <- matrix(as.numeric(NA), nn, lltry)
for (ii in 1:lltry)
  psi[, ii] <- yeo.johnson(y, lambda = ltry[ii])

## Not run: 
##D matplot(y, psi, type = "l", ylim = c(-4, 4), lwd = 2, lty = 1:lltry,
##D         ylab = "Yeo-Johnson transformation", col = 1:lltry, las = 1,
##D         main = "Yeo-Johnson transformation with some values of lambda")
##D abline(v = 0, h = 0)
##D legend(x = 1, y = -0.5, lty = 1:lltry, legend = as.character(ltry),
##D        lwd = 2, col = 1:lltry) 
## End(Not run)



