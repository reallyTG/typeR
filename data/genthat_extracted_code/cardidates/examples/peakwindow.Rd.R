library(cardidates)


### Name: peakwindow
### Title: Identify Peaks in Time Series
### Aliases: peakwindow
### Keywords: misc

### ** Examples

## generate test data with 3 peaks
set.seed(123)
x <- seq(0, 360, length = 20)
y <- abs(rnorm(20, mean = 1, sd = 0.1))
y[5:10] <- c(2, 4, 7, 3, 4, 2)
y <- c(y, 0.8 * y, 1.2 * y)
x <- seq(0, 360, along = y)
y[6] <- y[7]   # test case with 2 neighbouring equal points

## plot the test data
plot(x, y, type="b")

## identify the "spring mass development"
peaks <- peakwindow(x, y)
ind <- peaks$smd.indices
lines(x[ind], y[ind], col="red", lwd=2)

## now fit the cardinal dates
fit <- fitweibull6(peaks$smd.x, peaks$smd.y)
CDW(fit)
plot(fit)

## some more options ...
peaks <- peakwindow(x, y, xstart=150, mincut = 0.455)
ind <- peaks$smd.indices
lines(x[ind], y[ind], col = "blue")
points(x, y, col = peaks$peakid +1, pch = 16) # all peaks

## work with indices only
peaks <- peakwindow(y)

## test case with disturbed sinus
x<- 1:100
y <- sin(x/5) +1.5 + rnorm(x, sd = 0.2)
peaks <- peakwindow(x, y)
plot(x, y, type = "l", ylim = c(0, 3))
points(x, y, col = peaks$peakid + 2, pch = 16)

## test case: only one peak
yy <- c(1:10, 11:1)
peakwindow(yy)

## error handling test case: no turnpoints
# yy <- rep(1, length(x))
# peakwindow(x, yy)




