library(timsac)


### Name: mulrsp
### Title: Multiple Rational Spectrum
### Aliases: mulrsp
### Keywords: ts

### ** Examples

# Example 1 for the normal distribution
xorg <- rnorm(1003)
x <- matrix(0, nrow = 1000, ncol = 2)
x[, 1] <- xorg[1:1000]
x[, 2] <- xorg[4:1003] + 0.5*rnorm(1000)
aaa <- ar(x)
mulrsp(h = 20, d = 2, cov = aaa$var.pred, ar = aaa$ar, plot = TRUE,
       plot.scale = TRUE)

# Example 2 for the AR model
ar <- array(0, dim = c(3,3,2))
ar[, , 1] <- matrix(c(0.4,  0,   0.3,
                      0.2, -0.1, -0.5,
                      0.3,  0.1, 0), nrow = 3, ncol = 3, byrow = TRUE)
ar[, , 2] <- matrix(c(0,  -0.3,  0.5,
                      0.7, -0.4,  1,
                      0,   -0.5,  0.3), nrow = 3, ncol = 3, byrow = TRUE)
x <- matrix(rnorm(200*3), nrow = 200, ncol = 3)
y <- mfilter(x, ar, "recursive")
z <- fpec(y, max.order = 10)
mulrsp(h = 20, d = 3, cov = z$perr, ar = z$arcoef)



