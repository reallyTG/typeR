library(roptim)


### Name: example1_rosen_nograd_bfgs
### Title: Example 1: Minimize Rosenbrock function (with numerical
###   gradient) using BFGS
### Aliases: example1_rosen_nograd_bfgs

### ** Examples

fr <- function(x) {   ## Rosenbrock Banana function
 x1 <- x[1]
 x2 <- x[2]
 100 * (x2 - x1 * x1)^2 + (1 - x1)^2
}

optim(c(-1.2,1), fr, NULL, method = "BFGS")

## corresponding C++ implementation:
example1_rosen_nograd_bfgs()



