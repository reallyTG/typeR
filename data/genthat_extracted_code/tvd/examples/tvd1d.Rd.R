library(tvd)


### Name: tvd1d
### Title: Perform Total Variation Denoising on a 1-Dimensional Signal
### Aliases: tvd1d

### ** Examples

## Generate a stepped signal
x = rep(c(1, 2, 3, 4, 2, 4, 3, 2, 1), each = 100)

## Create a noisy version of the signal
y = x + rnorm(length(x), sd = 0.5)

## Denoise the signal by Condat's methodlines(x.denoised, col = "red", lwd = 1)
x.denoised = tvd1d(y, lambda = 10, method = "Condat")

## Plot the original signal, the noisy signal, and the denoised signal
plot(y, col = "black", pch = 19, cex = 0.3)
lines(x, col = "blue", lwd = 3)
lines(x.denoised, col = "red", lwd = 3)
legend("topleft", legend = c("Original", "Noisy", "Denoised"),
  col = c("blue", "black", "red"), lty = c("solid", "solid", "solid"),
  lwd = c(2, 0, 1), pch = c(NA, 19, NA), pt.cex = c(NA, 0.3, NA), inset = 0.05)



