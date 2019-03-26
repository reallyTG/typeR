library(VGAM)


### Name: loglapUC
### Title: The Log-Laplace Distribution
### Aliases: dloglap ploglap qloglap rloglap
### Keywords: distribution

### ** Examples

loc <- 0; sigma <- exp(0.5); kappa <- 1
x <- seq(-0.2, 5, by = 0.01)
## Not run: 
##D plot(x, dloglap(x, loc, sigma, kappa = kappa), type = "l", col = "blue",
##D      main = "Blue is density, red is cumulative distribution function",
##D      ylim = c(0,1), sub = "Purple are 5,10,...,95 percentiles", las = 1, ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(qloglap(seq(0.05,0.95,by = 0.05), loc, sigma, kappa = kappa),
##D       dloglap(qloglap(seq(0.05,0.95,by = 0.05), loc, sigma, kappa = kappa),
##D                 loc, sigma, kappa = kappa), col = "purple", lty = 3, type = "h")
##D lines(x, ploglap(x, loc, sigma, kappa = kappa), type = "l", col = "red")
##D abline(h = 0, lty = 2)
## End(Not run)
ploglap(qloglap(seq(0.05,0.95,by = 0.05), loc, sigma, kappa = kappa),
          loc, sigma, kappa = kappa)



