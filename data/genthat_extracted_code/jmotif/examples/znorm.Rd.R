library(jmotif)


### Name: znorm
### Title: Z-normalizes a time series by subtracting its mean and dividing
###   by the standard deviation.
### Aliases: znorm

### ** Examples

x = seq(0, pi*4, 0.02)
y = sin(x) * 5 + rnorm(length(x))
plot(x, y, type="l", col="blue")
lines(x, znorm(y, 0.01), type="l", col="red")



