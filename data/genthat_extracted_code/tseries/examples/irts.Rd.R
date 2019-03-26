library(tseries)


### Name: irts
### Title: Irregularly Spaced Time-Series
### Aliases: irts is.irts as.irts as.irts.default as.irts.zoo
### Keywords: ts

### ** Examples

n <- 10
t <- cumsum(rexp(n, rate = 0.1))
v <- rnorm(n)
x <- irts(t, v)
x

as.irts(cbind(t, v))

is.irts(x)

# Multivariate
u <- rnorm(n)
irts(t, cbind(u, v))



