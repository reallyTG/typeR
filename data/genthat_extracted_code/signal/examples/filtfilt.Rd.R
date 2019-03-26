library(signal)


### Name: filtfilt
### Title: Forward and reverse filter a signal
### Aliases: filtfilt filtfilt.default filtfilt.Arma filtfilt.Ma
###   filtfilt.Zpg
### Keywords: math

### ** Examples

bf <- butter(3, 0.1)                        # 10 Hz low-pass filter
t <- seq(0, 1, len = 100)                   # 1 second sample
x <- sin(2*pi*t*2.3) + 0.25*rnorm(length(t))# 2.3 Hz sinusoid+noise
y <- filtfilt(bf, x)
z <- filter(bf, x) # apply filter
plot(t, x)
points(t, y, col="red")
points(t, z, col="blue")
legend("bottomleft", legend = c("data", "filtfilt", "filter"), 
       pch = 1, col = c("black", "red", "blue"), bty = "n")



