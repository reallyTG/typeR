library(timsac)


### Name: mulcor
### Title: Multiple Correlation
### Aliases: mulcor print.mulcor
### Keywords: ts

### ** Examples

# Example 1 
y <- rnorm(1000)
dim(y) <- c(500,2)
mulcor(y, lag_axis = FALSE)

# Example 2
xorg <- rnorm(1003)
x <- matrix(0, nrow = 1000, ncol = 2)
x[, 1] <- xorg[1:1000]
x[, 2] <- xorg[4:1003] + 0.5*rnorm(1000)
mulcor(x, lag = 20)



