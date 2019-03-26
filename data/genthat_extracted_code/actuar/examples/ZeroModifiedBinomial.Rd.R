library(actuar)


### Name: ZeroModifiedBinomial
### Title: The Zero-Modified Binomial Distribution
### Aliases: ZeroModifiedBinomial ZMBinomial dzmbinom pzmbinom qzmbinom
###   rzmbinom
### Keywords: distribution

### ** Examples

dzmbinom(1:5, size = 5, prob = 0.4, p0 = 0.2)
(1-0.2) * dbinom(1:5, 5, 0.4)/pbinom(0, 5, 0.4, lower = FALSE) # same

## simple relation between survival functions
pzmbinom(0:5, 5, 0.4, p0 = 0.2, lower = FALSE)
(1-0.2) * pbinom(0:5, 5, 0.4, lower = FALSE) /
    pbinom(0, 5, 0.4, lower = FALSE) # same

qzmbinom(pzmbinom(1:10, 10, 0.6, p0 = 0.1), 10, 0.6, p0 = 0.1)

n <- 8; p <- 0.3; p0 <- 0.025
x <- 0:n
title <- paste("ZM Binomial(", n, ", ", p, ", p0 = ", p0,
               ") and Binomial(", n, ", ", p,") PDF",
               sep = "")
plot(x, dzmbinom(x, n, p, p0), type = "h", lwd = 2, ylab = "p(x)",
     main = title)
points(x, dbinom(x, n, p), pch = 19, col = "red")
legend("topright", c("ZT binomial probabilities", "Binomial probabilities"),
       col = c("black", "red"), lty = c(1, 0), lwd = 2, pch = c(NA, 19))



