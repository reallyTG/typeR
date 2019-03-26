library(nloptr)


### Name: newuoa
### Title: New Unconstrained Optimization with quadratic Approximation
### Aliases: newuoa

### ** Examples


fr <- function(x) {   ## Rosenbrock Banana function
    100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
}
(S <- newuoa(c(1, 2), fr))




