library(signal)


### Name: fftfilt
### Title: Filters with an FIR filter using the FFT
### Aliases: fftfilt filter.FftFilter FftFilter
### Keywords: math

### ** Examples

t <- seq(0, 1, len = 100)                     # 1 second sample
x <- sin(2*pi*t*2.3) + 0.25*rnorm(length(t))  # 2.3 Hz sinusoid+noise
z <- fftfilt(rep(1, 10)/10, x) # apply 10-point averaging filter
plot(t, x, type = "l")
lines(t, z, col = "red")




