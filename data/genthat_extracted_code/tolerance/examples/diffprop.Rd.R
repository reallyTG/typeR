library(tolerance)


### Name: DiffProp
### Title: Difference Between Two Proportions Distribution
### Aliases: DiffProp ddiffprop pdiffprop qdiffprop rdiffprop
### Keywords: file

### ** Examples

## Randomly generated data from the difference between
## two proportions distribution.

set.seed(100)
x <- rdiffprop(n = 100, k1 = 2, k2 = 10, n1 = 17, n2 = 13)
hist(x, main = "Randomly Generated Data", prob = TRUE)

x.1 <- sort(x)
y <- ddiffprop(x = x.1, k1 = 2, k2 = 10, n1 = 17, n2 = 13)
lines(x.1, y, col = 2, lwd = 2)

plot(x.1, pdiffprop(q = x.1, k1 = 2, k2 = 10, n1 = 17, 
     n2 = 13), type = "l", xlab = "x", 
     ylab = "Cumulative Probabilities")

qdiffprop(p = 0.20, k1 = 2, k2 = 10, n1 = 17, n2 = 13, 
          lower.tail = FALSE)
qdiffprop(p = 0.80, k1 = 2, k2 = 10, n1 = 17, n2 = 13)



