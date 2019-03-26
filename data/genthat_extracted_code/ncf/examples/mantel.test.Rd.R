library(ncf)


### Name: mantel.test
### Title: Mantel Test
### Aliases: mantel.test
### Keywords: spatial

### ** Examples

# first generate some sample data
x <- expand.grid(1:20, 1:5)[, 1]
y <- expand.grid(1:20, 1:5)[, 2]
# z data from an exponential random field
z <- cbind(
  rmvn.spa(x = x, y = y, p = 2, method = "exp"), 
  rmvn.spa(x = x, y = y, p = 2, method = "exp")
  )

# the Mantel test
mantel.test(x = x, y = y, z = z[, 1], resamp = 500)



