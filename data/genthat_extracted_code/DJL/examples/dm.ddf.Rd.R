library(DJL)


### Name: dm.ddf
### Title: Distance measure using DDF
### Aliases: dm.ddf

### ** Examples

# Additive form directional distance function
  # ready
  x <- matrix(c(5, 1, 4), ncol = 1)
  y <- matrix(c(8, 3, 5, 6, 4, 1), ncol = 2)
  g <- matrix(c(1), nrow = 3, ncol = 3) 
  w <- matrix(c(1, 0), ncol = 2)
  # go
  dm.ddf(x, y, "crs", g, w)

# Multiplicative form directional distance function
  # ready
  g <- cbind(x, y)
  # go
  dm.ddf(x, y, "crs", g, w)



