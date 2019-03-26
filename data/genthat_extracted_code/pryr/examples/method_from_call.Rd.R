library(pryr)


### Name: method_from_call
### Title: Given a function class, find correspoding S4 method
### Aliases: method_from_call

### ** Examples

library(stats4)

# From example(mle)
y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
nLL <- function(lambda) -sum(dpois(y, lambda, log = TRUE))
fit <- mle(nLL, start = list(lambda = 5), nobs = length(y))

method_from_call(summary(fit))
method_from_call(coef(fit))
method_from_call(length(fit))



