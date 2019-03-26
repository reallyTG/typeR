library(cbinom)


### Name: cbinom
### Title: The Continuous Binomial Distribution
### Aliases: dcbinom pcbinom qcbinom rcbinom

### ** Examples

require(graphics)
# Compare continous binomial to a standard binomial
size <- 20
prob <- 0.2
x <- 0:20
xx <- seq(0, 21, length = 200)
plot(x, pbinom(x, size, prob), xlab = "x", ylab = "P(X <= x)")
lines(xx, pcbinom(xx, size, prob))
legend('bottomright', legend = c("standard binomial", "continuous binomial"),
  pch = c(1, NA), lty = c(NA, 1))
mtext(side = 3, line = 1.5, text = "pcbinom resembles pbinom but continuous and shifted")
pbinom(x, size, prob) - pcbinom(x + 1, size, prob)

# Use "log = TRUE" for more accuracy in the tails and an extended range:
n <- 1000
k <- seq(0, n, by = 20)
cbind(exp(dcbinom(k, n, .481, log = TRUE)), dcbinom(k, n, .481))



