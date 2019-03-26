library(tolerance)


### Name: NegHypergeometric
### Title: The Negative Hypergeometric Distribution
### Aliases: NegHypergeometric dnhyper pnhyper qnhyper rnhyper
### Keywords: file

### ** Examples

## Randomly generated data from the negative hypergeometric 
## distribution.

set.seed(100)
x <- rnhyper(nn = 1000, m = 15, n = 40, k = 10)
hist(x, main = "Randomly Generated Data", prob = TRUE)

x.1 = sort(x)
y <- dnhyper(x = x.1, m = 15, n = 40, k = 10)
lines(x.1, y, col = 2, lwd = 2)

plot(x.1, pnhyper(q = x.1, m = 15, n = 40, k = 10),             
     type = "l", xlab = "x", ylab = "Cumulative Probabilities")

qnhyper(p = 0.20, m = 15, n = 40, k = 10, lower.tail = FALSE)
qnhyper(p = 0.80, m = 15, n = 40, k = 10)



