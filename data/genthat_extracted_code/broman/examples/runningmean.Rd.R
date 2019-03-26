library(broman)


### Name: runningmean
### Title: Running mean, sum, or median
### Aliases: runningmean
### Keywords: univar

### ** Examples

x <- 1:10000
y <- rnorm(length(x))
plot(x,y, xaxs="i", yaxs="i")
lines(x, runningmean(x, y, window=100, what="mean"),
      col="blue", lwd=2)
lines(x, runningmean(x, y, window=100, what="median"),
      col="red", lwd=2)
lines(x, runningmean(x, y, window=100, what="sd"),
      col="green", lwd=2)




