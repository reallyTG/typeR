library(ncf)


### Name: correlog
### Title: Uni- and multivariate spatial correlograms
### Aliases: correlog
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

# w data from a gaussian random field
w <- cbind(
  rmvn.spa(x = x, y = y, p = 2, method = "gaus"), 
  rmvn.spa(x = x, y = y, p = 2, method = "gaus")
  )

# Spatial correlogram 
fit1 <- correlog(x = x, y = y, z = z[, 1], increment = 2, resamp = 0) 
## Not run: plot(fit1)

# Mantel correlogram 
fit2 <- correlog(x = x, y = y, z = z, increment = 2, resamp = 0) 
## Not run: plot(fit2)

# Mantel cross-correlogram 
fit3 <- correlog(x = x, y = y, z = z, w = w, increment = 2, resamp = 0) 
## Not run: plot(fit3)



