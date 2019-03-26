library(VGAM)


### Name: laplaceUC
### Title: The Laplace Distribution
### Aliases: dlaplace plaplace qlaplace rlaplace
### Keywords: distribution

### ** Examples

loc <- 1; b <- 2
y <- rlaplace(n = 100, loc = loc, scale = b)
mean(y)  # sample mean
loc      # population mean
var(y)   # sample variance
2 * b^2  # population variance

## Not run: 
##D  loc <- 0; b <- 1.5; x <- seq(-5, 5, by = 0.01)
##D plot(x, dlaplace(x, loc, b), type = "l", col = "blue", ylim = c(0,1),
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple are 5,10,...,95 percentiles", las = 1, ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(qlaplace(seq(0.05,0.95,by = 0.05), loc, b),
##D       dlaplace(qlaplace(seq(0.05, 0.95, by = 0.05), loc, b), loc, b),
##D       col = "purple", lty = 3, type = "h")
##D lines(x, plaplace(x, loc, b), type = "l", col = "orange")
##D abline(h = 0, lty = 2) 
## End(Not run)

plaplace(qlaplace(seq(0.05, 0.95, by = 0.05), loc, b), loc, b)



