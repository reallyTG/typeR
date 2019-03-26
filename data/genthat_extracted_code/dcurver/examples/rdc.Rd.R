library(dcurver)


### Name: rdc
### Title: Random samples from univariate Davidian curves
### Aliases: rdc

### ** Examples

# Sample from the standard normal Davidian curve:
hist(rdc(1000, 1.570789), xlim = c(-6, 6), ylim = c(0, 0.5), freq = FALSE, breaks = 20)
curve(dnorm(x), -6, 6, col = "blue", lwd = 1, add = TRUE)
curve(ddc(x, 1.570789), -6, 6, col = "red", lwd = 2, lty = 3, add = TRUE)

# Sample from a bimodal density:
phi <- c(77.32, 78.51, 76.33, 77.16)
hist(rdc(1000, phi), xlim = c(-6, 6), ylim = c(0, 0.4), freq = FALSE, breaks = "fd")
curve(ddc(x, phi), -6, 6, col = "red", lwd = 2, lty = 3, add = TRUE)




