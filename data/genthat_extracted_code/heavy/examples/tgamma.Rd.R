library(heavy)


### Name: tgamma
### Title: The right truncated gamma distribution
### Aliases: tgamma dtgamma ptgamma qtgamma rtgamma
### Keywords: distribution

### ** Examples

x <- seq(0, 2, by = 0.1)
y <- dtgamma(x, shape = 1, truncation = 1)
z <- dgamma(x, shape = 1) # standard gamma pdf
plot(x, z, type = "l", xlab = "x", ylab = "density", ylim = range(y, z), lty = 2)
lines(x, y)

x <- rtgamma(1000, shape = 1)
## Q-Q plot for the right truncated gamma data against true theoretical distribution:
qqplot(qtgamma(ppoints(1000), shape = 1), x, main = "Truncated Gamma Q-Q plot",
  xlab = "Theoretical quantiles", ylab = "Sample quantiles", font.main = 1)
abline(c(0,1), col = "red", lwd = 2)



