library(actuar)


### Name: ZeroTruncatedBinomial
### Title: The Zero-Truncated Binomial Distribution
### Aliases: ZeroTruncatedBinomial ZTBinomial dztbinom pztbinom qztbinom
###   rztbinom
### Keywords: distribution

### ** Examples

dztbinom(1:5, size = 5, prob = 0.4)
dbinom(1:5, 5, 0.4)/pbinom(0, 5, 0.4, lower = FALSE) # same

pztbinom(1, 2, prob = 0)        # point mass at 1

qztbinom(pztbinom(1:10, 10, 0.6), 10, 0.6)

n <- 8; p <- 0.3
x <- 0:n
title <- paste("ZT Binomial(", n, ", ", p,
               ") and Binomial(", n, ", ", p,") PDF",
               sep = "")
plot(x, dztbinom(x, n, p), type = "h", lwd = 2, ylab = "p(x)",
     main = title)
points(x, dbinom(x, n, p), pch = 19, col = "red")
legend("topright", c("ZT binomial probabilities", "Binomial probabilities"),
       col = c("black", "red"), lty = c(1, 0), lwd = 2, pch = c(NA, 19))



