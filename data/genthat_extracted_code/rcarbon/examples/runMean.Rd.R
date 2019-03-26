library(rcarbon)


### Name: runMean
### Title: Calculate a running mean from a numeric vector.
### Aliases: runMean

### ** Examples

x <- rnorm(1000)
y <- c(1:1000)
plot(y,x, type="l")
lines(runMean(x,50), col="red")



