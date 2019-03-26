library(VGAM)


### Name: alaplaceUC
### Title: The Laplace Distribution
### Aliases: dalap palap qalap ralap
### Keywords: distribution

### ** Examples

x <- seq(-5, 5, by = 0.01)
loc <- 0; sigma <- 1.5; kappa <- 2
## Not run: 
##D  plot(x, dalap(x, loc, sigma, kappa = kappa), type = "l", col = "blue",
##D      main = "Blue is density, orange is cumulative distribution function",
##D      ylim = c(0, 1), sub = "Purple are 5, 10, ..., 95 percentiles",
##D      las = 1, ylab = "", cex.main = 0.5)
##D abline(h = 0, col = "blue", lty = 2)
##D lines(qalap(seq(0.05, 0.95, by = 0.05), loc, sigma, kappa = kappa),
##D       dalap(qalap(seq(0.05, 0.95, by = 0.05), loc, sigma, kappa = kappa),
##D             loc, sigma, kappa = kappa), col = "purple", lty = 3, type = "h")
##D lines(x, palap(x, loc, sigma, kappa = kappa), type = "l", col = "orange")
##D abline(h = 0, lty = 2) 
## End(Not run)

pp <- seq(0.05, 0.95, by = 0.05)  # Test two functions
max(abs(palap(qalap(pp, loc, sigma, kappa = kappa),
              loc, sigma, kappa = kappa) - pp))  # Should be 0



