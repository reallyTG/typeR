library(WaveletComp)


### Name: periodic.series
### Title: Computation of a (deterministic) periodic time series of
###   linearly changing period.
### Aliases: periodic.series
### Keywords: ts

### ** Examples

# The following time series involves periods from 100 through 50:
x <- periodic.series(start.period = 100, end.period = 50, make.plot = TRUE)
title("time series with period changing linearly from 100 to 50")

# The following three time series involve three different types of period evolution 
# starting from period 100:
x1 <- 0.8*periodic.series(start.period = 100, end.period = 95, phase = 0, length = 1000)
x2 <-     periodic.series(start.period = 100, end.period = 100, phase = 0, length = 1000)
x3 <- 1.2*periodic.series(start.period = 100, end.period = 105, phase = 0, length = 1000)

ts.plot(x2, ylim = c(-2, +2), xlab = "time", ylab = "series with variable period")
lines(x1, col = "blue")
lines(x3, col = "red")
legend("topleft", 
   legend = c("speeding up (end period = 95)", "period = 100", 
              "slowing down (end period = 105)"), 
   lty = 1, col = c("blue", "black", "red"))



