library(RSEIS)


### Name: hilow
### Title: Find Maxima and Minima
### Aliases: hilow
### Keywords: misc

### ** Examples

ex <- seq(from=0, to=4*pi, length = 200)

y <- sin(ex)
plot(ex, y, type='l')

peakval <- hilow(y)

abline(v=ex[peakval$hi], col='green')
abline(v=ex[peakval$lo], col='red')





