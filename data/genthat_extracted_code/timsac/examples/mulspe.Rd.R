library(timsac)


### Name: mulspe
### Title: Multiple Spectrum
### Aliases: mulspe ptint.mulspe
### Keywords: ts

### ** Examples

sgnl <- rnorm(1003)
x <- matrix(0, nrow = 1000, ncol = 2)
x[, 1] <- sgnl[4:1003]
# x[i,2] = 0.9*x[i-3,1] + 0.2*N(0,1)
x[, 2] <- 0.9*sgnl[1:1000] + 0.2*rnorm(1000)
mulspe(x, lag = 100, window = "Hanning", plot.scale = TRUE)



