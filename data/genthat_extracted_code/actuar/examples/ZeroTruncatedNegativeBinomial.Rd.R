library(actuar)


### Name: ZeroTruncatedNegativeBinomial
### Title: The Zero-Truncated Negative Binomial Distribution
### Aliases: ZeroTruncatedNegativeBinomial ZTNegativeBinomial ZTNegBinomial
###   dztnbinom pztnbinom qztnbinom rztnbinom
### Keywords: distribution

### ** Examples

## Example 6.3 of Klugman et al. (2012)
p <- 1/(1 + 0.5)
dztnbinom(c(1, 2, 3), size = 2.5, prob = p)
dnbinom(c(1, 2, 3), 2.5, p)/pnbinom(0, 2.5, p, lower = FALSE) # same

pztnbinom(1, 2, prob = 1)        # point mass at 1
dztnbinom(2, size = 1, 0.25)     # == dztgeom(2, 0.25)
dztnbinom(2, size = 0, 0.25)     # == dlogarithmic(2, 0.75)

qztnbinom(pztnbinom(1:10, 2.5, 0.3), 2.5, 0.3)

x <- rztnbinom(1000, size = 2.5, prob = 0.4)
y <- sort(unique(x))
plot(y, table(x)/length(x), type = "h", lwd = 2,
     pch = 19, col = "black", xlab = "x", ylab = "p(x)",
     main = "Empirical vs theoretical probabilities")
points(y, dztnbinom(y, size = 2.5, prob = 0.4),
       pch = 19, col = "red")
legend("topright", c("empirical", "theoretical"),
       lty = c(1, NA), lwd = 2, pch = c(NA, 19), col = c("black", "red"))



