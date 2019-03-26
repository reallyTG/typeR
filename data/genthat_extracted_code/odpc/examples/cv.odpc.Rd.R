library(odpc)


### Name: cv.odpc
### Title: Automatic Choice of Tuning Parameters for One-Sided Dynamic
###   Principal Components via Cross-Validation
### Aliases: cv.odpc

### ** Examples

T <- 50 #length of series
m <- 10 #number of series
set.seed(1234)
f <- rnorm(T + 1)
x <- matrix(0, T, m)
u <- matrix(rnorm(T * m), T, m)
for (i in 1:m) {
  x[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:T] + 10 * cos(2 * pi * (i/m)) * f[2:(T + 1)] + u[, i]
}
# Choose parameters to perform a one step ahead forecast. Use 1 or 2 lags, only one component 
# and a window size of 2 (artificially small to keep computation time low). Use two cores for the
# loop over k, two cores for the loop over the window
fit <- cv.odpc(x, h=1, k_list = 1:2, max_num_comp = 1, window_size = 2, ncores_k = 2, ncores_w = 2)



