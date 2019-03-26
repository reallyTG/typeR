library(nonneg.cg)


### Name: minimize.nonneg.cg
### Title: Non-Negative CG Minimizer
### Aliases: minimize.nonneg.cg

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
minimize.nonneg.cg(fr, grr, x0 = c(0,2))



