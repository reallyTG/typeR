library(tempR)


### Name: dist.city.block
### Title: Calculate city block distance between two matrices
### Aliases: dist.city.block

### ** Examples

  x <- matrix(0, nrow = 5, ncol = 7)
  y <- matrix(1, nrow = 5, ncol = 7)
  dist.city.block(x, y)

  y <- matrix(c(rep(0, 15), rep(1, 20)), nrow = 5, ncol = 7)
  dist.city.block(x, y)



