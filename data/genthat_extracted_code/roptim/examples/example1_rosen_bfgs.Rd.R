library(roptim)


### Name: example1_rosen_bfgs
### Title: Example 1: Minimize Rosenbrock function using BFGS
### Aliases: example1_rosen_bfgs

### ** Examples

fr <- function(x) {   ## Rosenbrock Banana function
 x1 <- x[1]
 x2 <- x[2]
 100 * (x2 - x1 * x1)^2 + (1 - x1)^2
}
grr <- function(x) { ## Gradient of 'fr'
 x1 <- x[1]
 x2 <- x[2]
 c(-400 * x1 * (x2 - x1 * x1) - 2 * (1 - x1),
   200 *      (x2 - x1 * x1))
}
res <- optim(c(-1.2,1), fr, grr, method = "BFGS", control = list(trace=TRUE), hessian = TRUE)
res

## corresponding C++ implementation:
example1_rosen_bfgs()



