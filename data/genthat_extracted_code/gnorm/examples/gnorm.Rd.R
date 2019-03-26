library(gnorm)


### Name: gnorm
### Title: The generalized normal distribution
### Aliases: gnorm dgnorm pgnorm qgnorm rgnorm

### ** Examples

# Plot generalized normal/exponential power density
# that corresponds to the standard normal density
xs <- seq(-1, 1, length.out = 100)
plot(xs, dgnorm(xs, mu = 0, alpha = sqrt(2), beta = 2), type = "l",
     xlab = "x", ylab = expression(p(x)))

# Plot the generalized normal/exponential power CDF
# that corresponds to the standard normal CDF
s <- seq(-1, 1, length.out = 100)
plot(xs, pgnorm(xs, 0, sqrt(2), 2), type = "l", xlab = "q",
     ylab = expression(paste("Pr(", x<=q, ")", sep = "")))

# Plot the generalized normal/exponential power inverse CDF
# that corresponds to the standard normal inverse CDF
xs <- seq(0, 1, length.out = 100)
plot(xs, qgnorm(xs, 0, sqrt(2), 2), type = "l", xlab = "p",
     ylab = expression(paste("q: p = Pr(", x<=q, ")", sep = "")))

# Make a histogram of draws from the generalized normal/exponential
# power distribution that corresponds to a standard normal distribution
xs <- rgnorm(100, 0, sqrt(2), 2)




