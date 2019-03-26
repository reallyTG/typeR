library(tolerance)


### Name: TwoParExponential
### Title: The 2-Parameter Exponential Distribution
### Aliases: TwoParExponential d2exp p2exp q2exp r2exp
### Keywords: file

### ** Examples

## Randomly generated data from the 2-parameter exponential 
## distribution.

set.seed(100)
x <- r2exp(n = 500, rate = 3, shift = -10)
hist(x, main = "Randomly Generated Data", prob = TRUE)

x.1 = sort(x)
y <- d2exp(x = x.1, rate = 3, shift = -10)
lines(x.1, y, col = 2, lwd = 2)

plot(x.1, p2exp(q = x.1, rate = 3, shift = -10), type = "l", 
     xlab = "x", ylab = "Cumulative Probabilities")

q2exp(p = 0.20, rate = 3, shift = -10, lower.tail = FALSE)
q2exp(p = 0.80, rate = 3, shift = -10)



