library(DJL)


### Name: dm.sf
### Title: Distance measure using SF
### Aliases: dm.sf

### ** Examples

# Additive form shortage function
  # ready
  x <- matrix(c(5, 1, 4), ncol = 1)
  y <- matrix(c(8, 3, 5, 6, 4, 1), ncol = 2)
  g <- matrix(c(1), nrow = 3, ncol = 3) 
  w <- matrix(c(1, 0), ncol = 2)
  # go
  dm.sf(x, y, "crs", g, w)

# Multiplicative form shortage function
  # ready
  g <- cbind(x, y)
  # go
  dm.sf(x, y, "crs", g, w)



