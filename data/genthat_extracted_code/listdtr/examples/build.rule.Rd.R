library(listdtr)


### Name: build.rule
### Title: Low-level Functions for Handling List-based Rules
### Aliases: build.rule build.rule.cv apply.rule show.rule verbalize.rule
###   draw.rule
### Keywords: tree

### ** Examples

  x <- matrix(rnorm(200 * 10), 200, 10)
  y <- cbind(
    a1 = as.double(x[, 1] < 0) + rnorm(200, 0, 0.1),
    a2 = as.double(x[, 2] > 0) + rnorm(200, 0, 0.1))
  y[y < 0] <- 0
  
  obj <- build.rule(x, y)
  show.rule(obj)
  draw.rule(obj)
  
  xnew <- matrix(rnorm(1000 * 10), 1000, 10)
  ynew <- apply.rule(obj, xnew)
  table(factor(xnew[, 1] < 0) : factor(xnew[, 2] < 0), ynew)



