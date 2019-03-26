library(signal)


### Name: sgolayfilt
### Title: Apply a Savitzky-Golay smoothing filter
### Aliases: sgolayfilt filter.sgolayFilter
### Keywords: math

### ** Examples

# Compare a 5 sample averager, an order-5 butterworth lowpass
# filter (cutoff 1/3) and sgolayfilt(x, 3, 5), the best cubic
# estimated from 5 points.
bf <- butter(5,1/3)
x <- c(rep(0,15), rep(10, 10), rep(0, 15))
sg <- sgolayfilt(x)
plot(sg, type="l")
lines(filtfilt(rep(1, 5)/5,1,x), col = "red") # averaging filter
lines(filtfilt(bf,x), col = "blue")           # butterworth
points(x, pch = "x")                          # original data



