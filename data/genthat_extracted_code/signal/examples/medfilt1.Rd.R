library(signal)


### Name: medfilt1
### Title: Median filter
### Aliases: medfilt1 MedianFilter filter.MedianFilter
### Keywords: math

### ** Examples

t <- seq(0, 1, len=100)                            # 1 second sample
x <- sin(2*pi*t*2.3) + 0.25*rlnorm(length(t), 0.5) # 2.3 Hz sinusoid+noise
plot(t, x, type = "l")
# 3-point filter
lines(t, medfilt1(x), col="red", lwd=2) 
# 7-point filter
lines(t, filter(MedianFilter(7), x), col = "blue", lwd=2) # another way to call it



