library(VGAM)


### Name: skewnorm
### Title: Skew-Normal Distribution
### Aliases: skewnorm dskewnorm rskewnorm
### Keywords: distribution

### ** Examples

## Not run: 
##D  N <- 200  # Grid resolution
##D shape <- 7; x <- seq(-4, 4, len = N)
##D plot(x, dskewnorm(x, shape = shape), type = "l", col = "blue", las = 1,
##D      ylab = "", lty = 1, lwd = 2)
##D abline(v = 0, h = 0, col = "grey")
##D lines(x, dnorm(x), col = "orange", lty = 2, lwd = 2)
##D legend("topleft", leg = c(paste("Blue = dskewnorm(x, ", shape,")", sep = ""),
##D        "Orange = standard normal density"), lty = 1:2, lwd = 2,
##D        col = c("blue", "orange")) 
## End(Not run)



