library(VGAM)


### Name: log1mexp
### Title: Logarithms with an Unit Offset and Exponential Term
### Aliases: log1mexp log1pexp

### ** Examples

x <-  c(10, 50, 100, 200, 400, 500, 800, 1000, 1e4, 1e5, 1e20, Inf, NA)
log1pexp(x)
log(1 + exp(x))  # Naive; suffers from overflow
log1mexp(x)
log(1 - exp(-x))
y <- -x
log1pexp(y)
log(1 + exp(y))  # Naive; suffers from inaccuracy



