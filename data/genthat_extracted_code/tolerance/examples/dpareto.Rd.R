library(tolerance)


### Name: DiscretePareto
### Title: Discrete Pareto Distribution
### Aliases: DiscretePareto ddpareto pdpareto qdpareto rdpareto
### Keywords: file

### ** Examples

## Randomly generated data from the discrete Pareto
## distribution.

set.seed(100)
x <- rdpareto(n = 150, theta = 0.2)
hist(x, main = "Randomly Generated Data", prob = TRUE)

x.1 <- sort(x)
y <- ddpareto(x = x.1, theta = 0.2)
lines(x.1, y, col = 2, lwd = 2)

plot(x.1, pdpareto(q = x.1, theta = 0.2), type = "l", 
     xlab = "x", ylab = "Cumulative Probabilities")

qdpareto(p = 0.80, theta = 0.2, lower.tail = FALSE)
qdpareto(p = 0.95, theta = 0.2)



