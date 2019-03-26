library(nloptr)


### Name: bobyqa
### Title: Bound Optimization by Quadratic Approximation
### Aliases: bobyqa

### ** Examples


fr <- function(x) {   ## Rosenbrock Banana function
    100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
}
(S <- bobyqa(c(0, 0, 0), fr, lower = c(0, 0, 0), upper = c(0.5, 0.5, 0.5)))




