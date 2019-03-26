library(logcondens)


### Name: isoMean
### Title: Pool-Adjacent Violaters Algorithm: Least Square Fit under
###   Monotonicity Constraint
### Aliases: isoMean
### Keywords: htest nonparametric

### ** Examples

## simple regression model
n <- 50
x <- sort(runif(n, 0, 1))
y <- x ^ 2 + rnorm(n, 0, 0.2)
s <- seq(0, 1, by = 0.01)
plot(s, s ^ 2, col = 2, type = 'l', xlim = range(c(0, 1, x)), 
    ylim = range(c(0, 1 , y))); rug(x)

## plot pava result
lines(x, isoMean(y, rep(1 / n, n)), type = 's')



