library(signal)


### Name: filter
### Title: Filter a signal
### Aliases: filter filter.default filter.Arma filter.Ma filter.Zpg
### Keywords: math

### ** Examples

bf <- butter(3, 0.1)                          # 10 Hz low-pass filter
t <- seq(0, 1, len = 100)                     # 1 second sample
x <- sin(2*pi*t*2.3) + 0.25*rnorm(length(t))  # 2.3 Hz sinusoid+noise
z <- filter(bf, x) # apply filter
plot(t, x, type = "l")
lines(t, z, col = "red")




