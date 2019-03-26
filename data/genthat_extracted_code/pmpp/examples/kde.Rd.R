library(pmpp)


### Name: kde
### Title: One-dimensional kernel density estimate
### Aliases: kde

### ** Examples

set.seed(1)
data <- c(rnorm(10 ^ 3), rnorm(10 ^ 3) * 2 + 30)
d <- kde(data)
plot(d[1,], d[2,], type = 'l', xlab = 'x', ylab = 'density f(x)')



