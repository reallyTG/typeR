library(roptim)


### Name: example1_rosen_other_methods
### Title: Example 1: Minimize Rosenbrock function using other methods
### Aliases: example1_rosen_other_methods

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

optim(c(-1.2,1), fr)

## These do not converge in the default number of steps
optim(c(-1.2,1), fr, grr, method = "CG")
optim(c(-1.2,1), fr, grr, method = "CG", control = list(type = 2))

optim(c(-1.2,1), fr, grr, method = "L-BFGS-B")

optim(c(-1.2,1), fr, method = "SANN")

## corresponding C++ implementation:
example1_rosen_other_methods()



