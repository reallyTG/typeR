library(signal)


### Name: interp
### Title: Interpolate / Increase the sample rate
### Aliases: interp
### Keywords: math

### ** Examples

# The graph shows interpolated signal following through the
# sample points of the original signal.
t <- seq(0, 2, by = 0.01)
x <- chirp(t, 2, 0.5, 10, 'quadratic') + sin(2*pi*t*0.4)
y <- interp(x[seq(1, length(x), by = 4)], 4, 4, 1) # interpolate a sub-sample
plot(t, x, type = "l")
idx <- seq(1,length(t),by = 4)
lines(t, y[1:length(t)], col = "blue")
points(t[idx], y[idx], col = "blue", pch = 19)



