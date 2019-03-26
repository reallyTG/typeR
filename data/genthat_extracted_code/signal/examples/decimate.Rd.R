library(signal)


### Name: decimate
### Title: Decimate or downsample a signal
### Aliases: decimate
### Keywords: math

### ** Examples

# The signal to decimate starts away from zero, is slowly varying
# at the start and quickly varying at the end, decimate and plot.
# Since it starts away from zero, you will see the boundary
# effects of the antialiasing filter clearly.  You will also see
# how it follows the curve nicely in the slowly varying early
# part of the signal, but averages the curve in the quickly
# varying late part of the signal.
t <- seq(0, 2, by = 0.01)
x <- chirp(t, 2, 0.5, 10, 'quadratic') + sin(2*pi*t*0.4)
y <- decimate(x, 4)   # factor of 4 decimation
plot(t, x, type = "l")
lines(t[seq(1,length(t), by = 4)], y, col = "blue")



