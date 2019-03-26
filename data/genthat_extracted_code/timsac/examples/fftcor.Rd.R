library(timsac)


### Name: fftcor
### Title: Auto And/Or Cross Correlations via FFT
### Aliases: fftcor
### Keywords: ts

### ** Examples

# Example 1
x <- rnorm(200)
y <- rnorm(200)
xy <- array(c(x,y), dim = c(200,2))
fftcor(xy, lag_axis = FALSE)

# Example 2
xorg <- rnorm(1003)
x <- matrix(0, nrow = 1000, ncol = 2)
x[, 1] <- xorg[1:1000]
x[, 2] <- xorg[4:1003] + 0.5*rnorm(1000)
fftcor(x, lag = 20)



