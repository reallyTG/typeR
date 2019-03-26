library(signal)


### Name: resample
### Title: Change the sampling rate of a signal
### Aliases: resample
### Keywords: math

### ** Examples

xf <- seq(0, 10.95, by=0.05)
yf <- sin(2*pi*xf/5)
xp <- 0:10
yp <- sin(2*pi*xp/5)
r <- resample(yp, xp[2], xf[2])
title("confirm that the resampled function matches the original")
plot(xf, yf, type = "l", col = "blue")
lines(xf, r[1:length(xf)], col = "red")
points(xp,yp, pch = 19, col = "blue")
legend("bottomleft", c("Original", "Resample", "Data"),
       col = c("blue", "red", "blue"),
       pch = c(NA, NA, 19),
       lty = c(1, 1, NA), bty = "n")



