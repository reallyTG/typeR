library(tolerance)


### Name: PoissonLindley
### Title: Discrete Poisson-Lindley Distribution
### Aliases: PoissonLindley dpoislind ppoislind qpoislind rpoislind
### Keywords: file

### ** Examples

## Randomly generated data from the Poisson-Lindley
## distribution.

set.seed(100)
x <- rpoislind(n = 150, theta = 0.5)
hist(x, main = "Randomly Generated Data", prob = TRUE)

x.1 <- sort(x)
y <- dpoislind(x = x.1, theta = 0.5)
lines(x.1, y, col = 2, lwd = 2)

plot(x.1, ppoislind(q = x.1, theta = 0.5), type = "l", 
     xlab = "x", ylab = "Cumulative Probabilities")

qpoislind(p = 0.20, theta = 0.5, lower.tail = FALSE)
qpoislind(p = 0.80, theta = 0.5)



