library(actuar)


### Name: ZeroTruncatedPoisson
### Title: The Zero-Truncated Poisson Distribution
### Aliases: ZeroTruncatedPoisson ZTPoisson dztpois pztpois qztpois rztpois
### Keywords: distribution

### ** Examples

dztpois(1:5, lambda = 1)
dpois(1:5, lambda = 1)/ppois(0, 1, lower = FALSE) # same

pztpois(1, lambda = 0)          # point mass at 1

qztpois(pztpois(1:10, 1), 1)

x <- seq(0, 8)
plot(x, dztpois(x, 2), type = "h", lwd = 2, ylab = "p(x)",
     main = "Zero-Truncated Poisson(2) and Poisson(2) PDF")
points(x, dpois(x, 2), pch = 19, col = "red")
legend("topright", c("ZT Poisson probabilities", "Poisson probabilities"),
       col = c("black", "red"), lty = c(1, 0), lwd = 2, pch = c(NA, 19))



