library(ncf)


### Name: correlog.nc
### Title: Non-centered spatial (cross-)correlogram
### Aliases: correlog.nc
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

# noncentered (Mantel) correlogram 
fit1 <- correlog.nc(x = x, y = y, z = z, increment = 2, resamp = 500)
## Not run: plot(fit1)



